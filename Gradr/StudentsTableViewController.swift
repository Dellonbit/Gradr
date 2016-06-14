//
//  StudentsTableViewController.swift
//  Gradr
//
//  Created by arianne on 2016-06-11.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewWillAppear(animated: Bool) {
//        dispatch_async(dispatch_get_main_queue(), {
//        if GradConvenience.sharedInstance().courseStud.count == 0 {
//            let msg = " No student registered yet. Click plus button to add."
//            self.showMsg(msg)
//            }
//        })
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  GradConvenience.sharedInstance().courseStud.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studReuse", forIndexPath: indexPath)
        let studData = GradConvenience.sharedInstance().courseStud[indexPath.row]
        cell.textLabel?.text = studData.name
        // Configure the cell...

        return cell
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //let std =  GradConvenience.sharedInstance().studLst[indexPath.row]
        //GradConvenience.sharedInstance().courseLabel = std.course
        
        dispatch_async(dispatch_get_main_queue(), {
            self.performSegueWithIdentifier("toStudEditor", sender: self)
        })
        
    }
    
    @IBAction func addNewStud(sender: AnyObject) {
        dispatch_async(dispatch_get_main_queue(), {
           self.performSegueWithIdentifier("newStud", sender: self)
        })
    }
    
    
    func showMsg(msg:String) {
        let alert = UIAlertController(title: "", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
    }
    
}
