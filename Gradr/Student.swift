//
//  Student.swift
//  Gradr
//
//  Created by arianne on 2016-06-11.
//  Copyright © 2016 della. All rights reserved.
//

import Foundation
import CoreData


class Student: NSManagedObject {

// Insert code here to add functionality to your managed object subclass

    @NSManaged var course: String?
    @NSManaged var grade: String?
    @NSManaged var name: String?
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(studName: String, studClass: String, studGrade: String, context: NSManagedObjectContext){
        let entity =  NSEntityDescription.entityForName("Student", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        course = studClass
        name = studName
        grade = studGrade
    }

}