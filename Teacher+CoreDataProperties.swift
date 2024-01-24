//
//  Teacher+CoreDataProperties.swift
//  SchoolSystem
//
//  Created by Milu Ann George on 23/01/24.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var empID: Int32
    @NSManaged public var person: Person?

}
