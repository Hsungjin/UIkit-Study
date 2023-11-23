//
//  ToDoListitem+CoreDataProperties.swift
//  TodoList-CoreData
//
//  Created by 황성진 on 11/23/23.
//
//

import Foundation
import CoreData


extension ToDoListitem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDoListitem> {
        return NSFetchRequest<ToDoListitem>(entityName: "ToDoListitem")
    }

    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?

}

extension ToDoListitem : Identifiable {

}
