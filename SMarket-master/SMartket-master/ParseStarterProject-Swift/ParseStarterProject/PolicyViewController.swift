//
//  PolicyViewController.swift
//  ParseStarterProject-Swift
//
//  Created by David Baek on 4/6/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class PolicyViewController: UIViewController {

    func displayAlert(title: String, message: String) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    @IBAction func disagree(sender: AnyObject) {
        
        // displaying alert
        displayAlert("You cannot disagree!", message: "In order to use this app, you must agree to the following terms.")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
