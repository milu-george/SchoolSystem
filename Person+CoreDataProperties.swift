//
//  Person+CoreDataProperties.swift
//  SchoolSystem
//
//  Created by Milu Ann George on 23/01/24.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var age: Int16
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var student: Student?
    @NSManaged public var teacher: Teacher?

}

extension Person : Identifiable {

}
