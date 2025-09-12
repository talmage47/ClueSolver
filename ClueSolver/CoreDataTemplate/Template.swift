//
//  Template.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/11/25.
//

import Foundation
import CoreData

@objc(Template)
public class Template: NSManagedObject {
    @NSManaged public var id: UUID
    @NSManaged public var name: String?
    @NSManaged public var characters: Set<CharacterTemplate>?
    @NSManaged public var weapons: Set<WeaponTemplate>?
    @NSManaged public var rooms: Set<RoomTemplate>?
}

extension Template {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Template> {
        return NSFetchRequest<Template>(entityName: "Template")
    }
}
