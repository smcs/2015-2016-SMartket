//
//  BuyTableViewController.swift
//  SmartketUI2.0
//
//  Created by Jason Qian on 2/29/16.
//  Copyright © 2016 Jason Qian. All rights reserved.
//

/*
Make it so that the data is stored in an array. Parse will save the data and we will then call on parse and put this data in an array and then we don't need to store the index numbers. 
    Call it as a string and just use that as the index
Don't need to make a seperate class for it.

*/

import Parse
import UIKit


// empty string array
var objectIds = [String]()
var label = [String]()
var price = [String]()
var condition = [String]()


class BuyTableViewController: UITableViewController {
    
    // save objectIds to an array
    func loadDataFromParse () {
        
        let query = PFQuery(className:"Data")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) objects.")
                
                // Add found objectIds to an array
                for object in objects! {
                    objectIds.append(object.objectId! as String)
                    print(objectIds)
                }
            } else {
                print(error)
            }
            
        }

            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        loadDataFromParse()
        print(objectIds)

        
        
        // using objectIDs to query other information
        
        var query:PFQuery = PFQuery(className: "Data")
        query.whereKey("objectId", equalTo: objectIds)
        
        query.findObjectsInBackgroundWithBlock {
            (object, error) -> Void in
            if error == nil
            {
                print("Successfully retrieved \(object!.count) records.")
                
                
                
                
            }
        }
        
        
        
        

       
        
    }
    
    // creating cells
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return objectIds.count
    }
    
    // putting information into cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        cell.textLabel?.text = label[indexPath.row] + " " + price[indexPath.row] + " " + condition[indexPath.row]
        
        return cell
        
    }
  
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    


    /*
        */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

