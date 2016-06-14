//
//  GradConvenience.swift
//  Gradr
//
//  Created by arianne on 2016-06-13.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit

class GradConvenience{

    var cours = [Course]()
    var studLst = [Student]()
    var courseLabel: String!
    var courseStud = [Student]()
   
    
    
    // MARK: - Shared Instance: singleton class
    class func sharedInstance() -> GradConvenience {
        
        struct Singleton {
            static var sharedInstance = GradConvenience()
        }
        return Singleton.sharedInstance
    }


}