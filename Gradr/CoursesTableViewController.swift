//
//  CoursesTableViewController.swift
//  Gradr
//
//  Created by arianne on 2016-06-11.
//  Copyright © 2016 della. All rights reserved.
//

import UIKit

class CoursesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return GradConvenience.sharedInstance().cours.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("courseReuse", forIndexPath: indexPath)
        let cour = GradConvenience.sharedInstance().cours[indexPath.row]
        cell.textLabel?.text = cour.name
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       let couss =  GradConvenience.sharedInstance().cours[indexPath.row]
        GradConvenience.sharedInstance().courseLabel = couss.name
        GradConvenience.sharedInstance().courseStud.removeAll()
        
        dispatch_async(dispatch_get_main_queue(), {
            for stdCours in GradConvenience.sharedInstance().studLst {
                if stdCours.course == couss.name {
                   GradConvenience.sharedInstance().courseStud.append(stdCours)
                   print(stdCours.name)
                }
            }
        })
        
        //self.performSegueWithIdentifier("toStudList", sender: self)
    }
    
}
