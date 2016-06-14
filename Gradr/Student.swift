//
//  Student.swift
//  Gradr
//
//  Created by arianne on 2016-06-14.
//  Copyright © 2016 della. All rights reserved.
//

import Foundation
import CoreData


class Student: NSManagedObject {

    @NSManaged var courseName: String?
    @NSManaged var grade: String?
    @NSManaged var name: String?
    
    
// Insert code here to add functionality to your managed object subclass

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(stdName: String, coursName: String, stdgrade: String, context: NSManagedObjectContext){
        let entity =  NSEntityDescription.entityForName("Student", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        name = stdName
        courseName = coursName
        grade = stdgrade
    }

    
    
}
