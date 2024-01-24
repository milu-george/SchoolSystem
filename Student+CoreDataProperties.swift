//
//  Student+CoreDataProperties.swift
//  SchoolSystem
//
//  Created by Milu Ann George on 23/01/24.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var rollNo: Int32
    @NSManaged public var person: Person?

}
