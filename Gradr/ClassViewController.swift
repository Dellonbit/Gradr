//
//  ViewController.swift
//  Gradr
//
//  Created by arianne on 2016-05-27.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit
import CoreData

class ClassViewController: UIViewController {

    
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
        let fetchRequest = NSFetchRequest(entityName: "Instructor")
        var locations  = [Instructor]()
        

        
        do {
            locations =
                try managedContext.executeFetchRequest(fetchRequest) as! [Instructor]
        
        }
        catch let error as NSError {
        
        
        }
        
        
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}





