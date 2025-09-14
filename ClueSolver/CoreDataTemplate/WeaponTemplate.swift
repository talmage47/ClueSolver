//
//  WeaponCard.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 9/11/25.
//

import Foundation
import CoreData

@objc(WeaponTemplate)
public class WeaponTemplate: NSManagedObject {
    @NSManaged public var name: String
    @NSManaged public var template: Template?
}

extension WeaponTemplate {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeaponTemplate> {
        return NSFetchRequest<WeaponTemplate>(entityName: "WeaponTemplate")
    }
}
