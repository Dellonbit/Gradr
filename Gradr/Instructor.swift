//
//  Instructor.swift
//  Gradr
//
//  Created by arianne on 2016-06-11.
//  Copyright © 2016 della. All rights reserved.
//

import Foundation
import CoreData


class Instructor: NSManagedObject {
    @NSManaged var course: String?
    @NSManaged var username: String?
// Insert code here to add functionality to your managed object subclass

    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }
    
    init(teachclass: String, teachName: String, context: NSManagedObjectContext){
        let entity =  NSEntityDescription.entityForName("Instructor", inManagedObjectContext: context)!
        super.init(entity: entity, insertIntoManagedObjectContext: context)
        course = teachclass
        username = teachName
    }
    
}
