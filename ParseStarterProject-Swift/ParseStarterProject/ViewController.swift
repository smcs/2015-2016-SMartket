/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    @available(iOS 8.0, *)
    func alertMessage(title: String, message: String) {
        
        var alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        //add action button to the alert controller
        alert.addAction((UIAlertAction(title : "OK", style: .Default, handler: { (action) -> Void in
            
            //dismisses the appearing alert button
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        //display the alert controller in the ViewController
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @available(iOS 8.0, *)
    @IBAction func signUp(sender: AnyObject) {
        //check whether the user has entered username/password = error check
        if username.text == "" || password.text == "" {
           
            self.alertMessage("Error", message: "Please enter a username/password")
            
            
        }else{
            
            //spinning wheel that indicates that an activity is in progress
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            
            //hides the spinning wheel when activity is stopped
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            
            //add activityIndicator to the view
            view.addSubview(activityIndicator)
            
            //stops users from interacting with the app
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            
            
            //Sign Up Procedure
            var user = PFUser()
            user.username = username.text
            user.password = password.text
            
            //send the username and password over to Parse cloud
            user.signUpInBackgroundWithBlock({ (success,  error) -> Void in
                
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    
                    //SignUp Successful! = find a way to display this message***
                    
                } else {
                    
                    //SignUp not successful
                
                    //Finds what the error is
                    if var errorString = error!.userInfo["error"] as? NSString {
                        
                        //display that error
                        self.alertMessage("Failed SignUp", message: errorString as String)
                        
                    }
                    
                }
                
                
            })
            
        }
        
    }
    
    
    
    @IBAction func logIn(sender: AnyObject) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Immediately after the view appears
            
        }
        
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
