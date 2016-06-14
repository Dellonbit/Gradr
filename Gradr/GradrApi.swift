//
//  GradrApi.swift
//  Gradr
//
//  Created by arianne on 2016-06-14.
//  Copyright © 2016 della. All rights reserved.
//

import Foundation

extension GradConvenience {

    // get students taking a particular course
    func getStdbyClass(courseName: String, completion: (success: Bool, errormsg: String) -> Void){
      
        courseLabel = courseName
        courseStud.removeAll()
        print ("selected")
        dispatch_async(dispatch_get_main_queue(), {
            for stdCours in self.studLst {
                if stdCours.courseName == courseName {
                    self.courseStud.append(stdCours)
                    print(stdCours.name)
                }
            }
            completion (success: true, errormsg: "nno error")
        })
        
    }


}