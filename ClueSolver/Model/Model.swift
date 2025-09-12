//
//  Model.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/1/25.
//

import Foundation
import CoreData

@Observable
class Model {
   static let shared = Model()
   var context: NSManagedObjectContext? = nil
   var currentGame: Game?
   
   /// Fetches all templates from the given managed object context.
   /// If no context is provided, uses the `context` property of this class.
   /// - Parameter context: An optional `NSManagedObjectContext` to fetch from.
   /// - Throws: An error if fetching fails or if context is not available.
   /// - Returns: Array of `Template` objects.
   func fetchTemplates(context: NSManagedObjectContext? = nil) throws -> [Template] {
       let ctx = context ?? self.context
       guard let context = ctx else {
           fatalError("Managed object context is not set")
       }
       let request: NSFetchRequest<Template> = Template.fetchRequest()
       return try context.fetch(request)
   }
   
   func startNewGame(newGame: Game) {
//        savedGames.insert(newGame)
       currentGame = newGame
   }
   
   func TemplateToGame(_ template: Template) -> Game{
       let newGame = Game()
       // Load characters
       if let characters = template.characters {
           newGame.characters = characters.map { GameCharacter(characterName: $0.name) }
       }
       // Load weapons
       if let weapons = template.weapons {
           newGame.weapons = weapons.map { Weapon(weaponName: $0.name) }
       }
       // Load rooms
       if let rooms = template.rooms {
           newGame.rooms = rooms.map { Room(roomName: $0.name) }
       }
       // Players are not in the template, so leave as is (empty)
       // Start the new game (adds to savedGames and sets currentGame)
       return newGame
   }
   
   /// Saves the given game as a template with the specified name into the provided context.
   /// If no context is provided, uses the `context` property of this class.
   /// - Parameters:
   ///   - game: The `Game` instance to save as a template.
   ///   - name: The name of the template.
   ///   - context: An optional `NSManagedObjectContext` to save into.
   /// - Throws: An error if saving fails or if context is not available.
   func saveTemplate(from game: Game, named name: String, context: NSManagedObjectContext? = nil) throws {
       let ctx = context ?? self.context
       guard let context = ctx else {
           fatalError("Managed object context is not set")
       }
       let template = Template(context: context)
       template.id = UUID()
       template.name = name

       // Characters
       var characterTemplates = Set<CharacterTemplate>()
       for character in game.characters {
           let ct = CharacterTemplate(context: context)
           ct.name = character.characterName
           ct.template = template
           characterTemplates.insert(ct)
       }
       template.characters = characterTemplates

       // Weapons
       var weaponTemplates = Set<WeaponTemplate>()
       for weapon in game.weapons {
           let wt = WeaponTemplate(context: context)
           wt.name = weapon.weaponName
           wt.template = template
           weaponTemplates.insert(wt)
       }
       template.weapons = weaponTemplates

       // Rooms
       var roomTemplates = Set<RoomTemplate>()
       for room in game.rooms {
           let rt = RoomTemplate(context: context)
           rt.name = room.roomName
           rt.template = template
           roomTemplates.insert(rt)
       }
       template.rooms = roomTemplates

       try context.save()
   }
   
}
