//
//  Course.swift
//  Gradr
//
//  Created by arianne on 2016-06-13.
//  Copyright © 2016 della. All rights reserved.
//

import Foundation
import CoreData


class Course: NSManagedObject {

    
    @NSManaged var name: String?
    @NSManaged var teacherName: String?
    
// Insert code here to add functionality to your managed object subclass
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(courseName: String, teachName: String, context: NSManagedObjectContext){
        let entity =  NSEntityDescription.entityForName("Course", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        name = courseName
        teacherName = teachName
    }
    
    
}
