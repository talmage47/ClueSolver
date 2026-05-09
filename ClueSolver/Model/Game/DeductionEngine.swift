//
//  DeductionEngine.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/30/25.
//

import Foundation

class DeductionEngine {

    var game: Game

    init(game: Game) {
        self.game = game
    }

    func processLatestGuess() {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self, let guess = self.game.guessRecord.last else { return }
            DispatchQueue.main.async {
                self.record(guess: guess)
                self.runInference()
            }
        }
    }

    private func record(guess: Guess) {
        guard let character = guess.character,
              let weapon = guess.weapon,
              let room = guess.room else { return }

        let cards: [Card] = [character, weapon, room]

        var participants = Set(guess.passers)
        if let guesser = guess.guesser { participants.insert(guesser) }
        if let disprover = guess.disprover { participants.insert(disprover) }

        for player in guess.passers {
            for card in cards { addNo(player: player, card: card) }
        }

        if let disprover = guess.disprover {
            if !alreadyHasMaybeSet(player: disprover, cards: cards) {
                disprover.maybeCardSets.append(cards)
            }
            for card in cards { addMaybe(player: disprover, card: card) }
        }

        for player in game.players where !participants.contains(player) {
            for card in cards { addUnknown(player: player, card: card) }
        }
    }

    // MARK: - State helpers

    private func addNo(player: Player, card: Card) {
        if !player.noCards.contains(card) {
            player.noCards.append(card)
            player.unknownCards.removeAll { $0 == card }
        }
        if !card.noPlayers.contains(player) {
            card.noPlayers.append(player)
            card.maybePlayers.removeAll { $0 == player }
            card.unknownPlayers.removeAll { $0 == player }
        }
    }

    private func addMaybe(player: Player, card: Card) {
        guard card.yesPlayer != player,
              !player.yesCards.contains(card),
              !player.noCards.contains(card) else { return }
        if !card.maybePlayers.contains(player) {
            card.maybePlayers.append(player)
            card.unknownPlayers.removeAll { $0 == player }
        }
        player.unknownCards.removeAll { $0 == card }
    }

    private func addUnknown(player: Player, card: Card) {
        guard card.yesPlayer != player,
              !player.yesCards.contains(card),
              !player.noCards.contains(card),
              !card.maybePlayers.contains(player),
              !card.noPlayers.contains(player) else { return }
        if !player.unknownCards.contains(card) { player.unknownCards.append(card) }
        if !card.unknownPlayers.contains(player) { card.unknownPlayers.append(player) }
    }

    private func alreadyHasMaybeSet(player: Player, cards: [Card]) -> Bool {
        let incoming = Set(cards.map { $0.id })
        return player.maybeCardSets.contains { Set($0.map { $0.id }) == incoming }
    }

    // MARK: - Inference

    private func runInference() {
        var changed = true
        while changed {
            changed = false
            for player in game.players {
                var i = 0
                while i < player.maybeCardSets.count {
                    let cardSet = player.maybeCardSets[i]
                    let undecided = cardSet.filter { !player.noCards.contains($0) && !player.yesCards.contains($0) }

                    if undecided.count == 1 {
                        if !player.yesCards.contains(undecided[0]) {
                            markYes(player: player, card: undecided[0])
                            changed = true
                        }
                        player.maybeCardSets.remove(at: i)
                    } else if undecided.isEmpty {
                        player.maybeCardSets.remove(at: i)
                    } else {
                        i += 1
                    }
                }
            }
        }
    }

    private func markYes(player: Player, card: Card) {
        if !player.yesCards.contains(card) {
            player.yesCards.append(card)
        }
        player.unknownCards.removeAll { $0 == card }

        card.yesPlayer = player
        card.maybePlayers.removeAll()
        card.unknownPlayers.removeAll()

        for other in game.players where other != player {
            addNo(player: other, card: card)
        }
    }
}
