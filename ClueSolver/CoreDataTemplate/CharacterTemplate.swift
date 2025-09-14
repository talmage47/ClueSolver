//
//  CharacterCard.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/11/25.
//

import Foundation
import CoreData

@objc(CharacterTemplate)
public class CharacterTemplate: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var template: Template?
}

extension CharacterTemplate {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterTemplate> {
        return NSFetchRequest<CharacterTemplate>(entityName: "CharacterTemplate")
    }
}
