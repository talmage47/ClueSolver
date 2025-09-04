//
//  Game.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/11/25.
//

import Foundation

@Observable
class Game: Hashable {
    let id = UUID()
    
    var players: [Player] = []
    var characters: [GameCharacter] = []
    var weapons: [Weapon] = []
    var rooms: [Room] = []
    
    var totalCards: Int {
        return characters.count
        + weapons.count
        + rooms.count
    }
    
    var cardsPerPlayer: Int {
        return totalCards / players.count
    }
    
    var userCards: Set<Card> = []
    var communityCards: Set<Card> = []
    
    var guessRecord: [Guess] = []
    
    var cardManager: CardManager!
    var deductionEngine: DeductionEngine!
    
    
    init() {
        self.cardManager = CardManager(game: self)
        self.deductionEngine = DeductionEngine(game: self)
    }

    static func mockGame() -> Game {
        let game = Game()
        let matthias = Player(playerName: "Matthias")
        let myla = Player(playerName: "Mylalala")
        let jon = Player(playerName: "Jonathan")
        let zach = Player(playerName: "Zachary")
        let megan = Player(playerName: "Megan")
        
        game.players = [
            matthias, myla, jon, zach, megan
        ]
        
        let scarlet = GameCharacter(characterName: "Miss Scarlet")
        let mustard = GameCharacter(characterName: "Colonel Mustard")
        let peacock = GameCharacter(characterName: "Miss Peacock")
        let green = GameCharacter(characterName: "Mister Green")
        let white = GameCharacter(characterName: "Mrs White")
        let plum = GameCharacter(characterName: "Mister Plum")
    
        let candlestick = Weapon(weaponName: "Candlestick")
        let dagger = Weapon(weaponName: "Dagger")
        let revolver = Weapon(weaponName: "Revolver")
        let rope = Weapon(weaponName: "Rope")
        let pipe = Weapon(weaponName: "Pipe")
        let wrench = Weapon(weaponName: "Wrench")
    
        let kitchen = Room(roomName: "Kitchen")
        let bathroom = Room(roomName: "Bathroom")
        let closet = Room(roomName: "Closet")
        let ballroom = Room(roomName: "Ballroom")
        let mancave = Room(roomName: "Mancave")
        let library = Room(roomName: "Library")
        let dining = Room(roomName: "Dining Room")
        let bedroom = Room(roomName: "Bedroom")
        let conservatory = Room(roomName: "Conservatory")
        
        
        game.characters = [
            scarlet, mustard, peacock, green, white, plum
        ]
        game.weapons = [
            candlestick, dagger, revolver, rope, pipe, wrench
        ]
        game.rooms = [
            kitchen, bathroom, closet, ballroom, mancave, library, dining, bedroom, conservatory
        ]
        
        let guess1 = Guess(userGuess: true)
        guess1.guesser = matthias
        guess1.character = green
        guess1.weapon = revolver
        guess1.room = closet
        guess1.passers = [myla]
        guess1.disprover = megan
        
        let guess2 = Guess(userGuess: false)
        guess2.guesser = myla
        guess2.character = mustard
        guess2.weapon = rope
        guess2.room = ballroom
        guess2.passers = [jon]
        // no disprover
        
        let guess3 = Guess(userGuess: false)
        guess3.guesser = zach
        guess3.character = scarlet
        guess3.weapon = dagger
        guess3.room = ballroom
        guess3.passers = [jon, matthias, megan]
        guess3.disprover = myla
        
        game.guessRecord = [guess1, guess2, guess3]
        
        return game
    }
    

    
    static func == (lhs: Game, rhs: Game) -> Bool {
        lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}
