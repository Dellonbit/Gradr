//
//  ViewController.swift
//  Gradr
//
//  Created by arianne on 2016-05-27.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit
import CoreData

class ClassViewController: UIViewController, UITextFieldDelegate  {

    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var teacherclass: UITextField!
    var isAdded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        username.delegate = self
        teacherclass.delegate = self
    }
    
    //enter button
    @IBAction func enterButton(sender: AnyObject) {
        
        let teachname = username.text
        let teachclass = teacherclass.text

        //retrieve data from coredata check for duplicates before storage
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Course")
        let fR = NSFetchRequest(entityName: "Student")
        var coursesList  = [Course]()
        var stdentList = [Student]()
        //print ("nothing here, \(teachname!)")
        
        do {
            stdentList = try managedContext.executeFetchRequest(fR) as! [Student]
                try managedContext.executeFetchRequest(fetchRequest) as! [Course]
            coursesList =
                try managedContext.executeFetchRequest(fetchRequest) as! [Course]
            GradConvenience.sharedInstance().studLst = stdentList
            
            if teachname! == "teacher's name" || teachclass! == "class name" || teachname! == "" || teachclass! == "" {
                let msg  = "username or password field empty"
                showMsg(msg)
                print ("nothing here, \(teachname!)")
            }
             else {
                
                if coursesList.count == 0 {
                    //print("added")
                    //new teacher add teacher and course
                    let savedCourse = Course(courseName: teachclass!, teachName: teachname!, context: managedContext)
                    coursesList.append(savedCourse)
                    GradConvenience.sharedInstance().cours = coursesList
                    
                    try managedContext.save()
                
                }else {
                
                       for itm in coursesList{
                            if itm.teacherName == teachname && itm.name == teachclass {
                                isAdded = true
                            }
                        }
                    
                        if !isAdded {
                            isAdded = false
                            //print("added nfew")
                            //new teacher add teacher and course
                            let savedCourse = Course(courseName: teachclass!, teachName: teachname!, context: managedContext)
                            coursesList.append(savedCourse)
                            GradConvenience.sharedInstance().cours = coursesList
                            try managedContext.save()
                        }
                    }
                
                //print( "\(coursesList)")
                self.performSegueWithIdentifier("toNav", sender: self)
            }
        
        }
        catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        
        }
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        username.resignFirstResponder()
        teacherclass.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        username.resignFirstResponder()
        teacherclass.resignFirstResponder()
        view.endEditing(true)
    }
    
    
    
    func showMsg(msg:String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


}





