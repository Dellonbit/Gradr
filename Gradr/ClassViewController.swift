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
        var teachers  = [Instructor]()
        
        
        do {
            teachers =
                try managedContext.executeFetchRequest(fetchRequest) as! [Instructor]
            if teachname == " " || teachclass == " " {
                var msg  = "username or password field empty"
                showMsg(msg)
            }
            else {
                for itm in teachers{
                    if itm.username == teachname{
                        // teacher already in database just add his course
//                        let savedRecipe = Recipe(recpName: RecipeName[item], recpCookTime: cookTime[item], pic: pic!, indPrep: arraystring, inst: instrxn[item].stringByReplacingOccurrencesOfString(".", withString:"\n"), context: managedContext)
//                        //emptystring
//                        arraystring = ""
//                        RecConvenience.sharedInstance().recipeList.append(savedRecipe)
//                        try managedContext.save()
                    }
                    else if itm.username != teachname{
                       // new teacher add teacher and course
//                        let savedRecipe = Recipe(recpName: RecipeName[item], recpCookTime: cookTime[item], pic: pic!, indPrep: arraystring, inst: instrxn[item].stringByReplacingOccurrencesOfString(".", withString:"\n"), context: managedContext)
//                        //emptystring
//                        arraystring = ""
//                        RecConvenience.sharedInstance().recipeList.append(savedRecipe)
//                        try managedContext.save()
                        
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





