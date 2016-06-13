//
//  GradeClassViewController.swift
//  Gradr
//
//  Created by arianne on 2016-05-27.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit
import CoreData

class GradeClassViewController: UIViewController {

    @IBOutlet weak var classTitle: UILabel!
    
    
    @IBOutlet weak var stdGrade: UITextField!
    @IBOutlet weak var stdName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // add student data to coredata
    @IBAction func addStudent(sender: AnyObject) {
    
       let stName = stdName.text
       let stGrade = stdGrade.text
       let stclass = classTitle.text
        
        //retrieve data from coredata check for duplicates before storage
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Student")
        var stdList  = [Student]()
        
        
        do {
            stdList =
                try managedContext.executeFetchRequest(fetchRequest) as! [Student]
            if stName == " " || stclass == " " || stGrade == " " {
                let msg  = "one or more fields needs to be filled"
                showMsg(msg)
            }
            else {
                for itm in stdList{
                    if itm.name == stName && itm.course == stclass {
                        // stdent already in database just add his  new grade course
                        //new teacher add teacher and course
                        let savedStd = Student(studName: stName!, studClass: stclass!, studGrade: stGrade!, context: managedContext)
                        stdList.append(savedStd)
                        GradConvenience.sharedInstance().studLst = stdList
                        try managedContext.save()
                        
                    }
                    else {
                        //new student data
                        let savedStd = Student(studName: stName!, studClass: stclass!, studGrade: stGrade!, context: managedContext)
                        stdList.append(savedStd)
                        GradConvenience.sharedInstance().studLst = stdList
                        try managedContext.save()
                        
                    }
                }
            }
            
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            
        }
        
    }
   
    
    func showMsg(msg:String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
}
