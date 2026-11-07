//
//  Item+CoreDataProperties.swift
//  LightWeightMigration CoreData
//
//  Created by PavunRaj on 06/11/26.
//
//

public import Foundation
public import CoreData


public typealias ItemCoreDataPropertiesSet = NSSet

extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var id: UUID?

}

extension Item : Identifiable {

}
