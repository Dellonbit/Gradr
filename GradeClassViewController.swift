//
//  GradeClassViewController.swift
//  Gradr
//
//  Created by arianne on 2016-05-27.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit

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
        
        //save data in coredata
        let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        _ = Student(studName: stName!, studClass: stclass!, studGrade: stGrade!, context: managedContext)
       
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        //dismissViewControllerAnimated(true, completion: nil)
        
    }
   
    
}
