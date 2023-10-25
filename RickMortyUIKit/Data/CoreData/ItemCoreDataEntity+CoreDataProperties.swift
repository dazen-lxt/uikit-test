//
//  ItemCoreDataEntity+CoreDataProperties.swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 24/10/23.
//
//

import Foundation
import CoreData


extension ItemCoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemCoreDataEntity> {
        return NSFetchRequest<ItemCoreDataEntity>(entityName: "ItemCoreDataEntity")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var image: String?
    @NSManaged public var page: Int32

}

extension ItemCoreDataEntity : Identifiable {

}
