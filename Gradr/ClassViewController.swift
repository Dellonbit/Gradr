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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //enter button
    @IBAction func enterButton(sender: AnyObject) {
        
        let teachname = username.text
        let teachclass = teacherclass.text

        //retrieve data from coredata check for duplicates before storage
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: "Course")
        var coursesList  = [Course]()
        
        
        do {
            coursesList =
                try managedContext.executeFetchRequest(fetchRequest) as! [Course]
            if teachname == " " || teachclass == " " {
                let msg  = "username or password field empty"
                showMsg(msg)
            }
            else {
                for itm in coursesList{
                    if itm.teacherName == teachname && itm.name == teachclass {
                        // teacher already in database just add his course
                        
                    }
                    else {
                        //new teacher add teacher and course
                        let savedCourse = Course(courseName: teachclass!, teachName: teachname!, context: managedContext)
                        coursesList.append(savedCourse)
                        GradConvenience.sharedInstance().cours = coursesList
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





