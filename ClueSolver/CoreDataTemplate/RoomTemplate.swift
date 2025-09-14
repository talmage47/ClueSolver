//
//  RoomCard.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/11/25.
//

import Foundation
import CoreData

@objc(RoomTemplate)
public class RoomTemplate: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var template: Template?
}

extension RoomTemplate {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomTemplate> {
        return NSFetchRequest<RoomTemplate>(entityName: "RoomTemplate")
    }
}
