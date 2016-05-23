//
//  LoginViewController.swift
//  ParseStarterProject-Swift
//
//  Created by David Baek on 3/4/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit
import Parse

@available(iOS 8.0, *)
class LoginViewController: UIViewController {

    var errorMessage = "Please try again later"
    var signupActive = true
    
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var signupButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var phoneNumber: UITextField!
    @IBOutlet var email: UITextField!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // displaying alert
    func displayAlert(title: String, message: String) {
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction((UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            
            self.dismissViewControllerAnimated(true, completion: nil)
            
        })))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func signUp(sender: AnyObject) {
     
        
        if username.text == "" || password.text == "" || phoneNumber.text == "" || email.text == ""{
            
            displayAlert("Error in form", message: "Please enter a username, password, phone and email")
            
            
        } else {
            
            // When the username and password is typed in...
            
            // spinning wheel - loading
            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
            
            
            
            let user = PFUser()
            user.username = username.text
            user.password = password.text
            user["phone"] = phoneNumber.text
            user.email = email.text
            
            // Parse original Sign Up Function!!!
            user.signUpInBackgroundWithBlock({ (success, error) -> Void in
                
                self.activityIndicator.stopAnimating()
                UIApplication.sharedApplication().endIgnoringInteractionEvents()
                
                if error == nil {
                    
                    // Signup successful
                    print("Sign Up Successful")
                    
                    self.performSegueWithIdentifier("segue", sender: nil)
                    
                } else {
                    
                    if let errorString = error!.userInfo["error"] as? String {
                        
                        self.errorMessage = errorString
                    }
                    
                    self.displayAlert("Failed SignUp", message: self.errorMessage)
                    
                }
                
            })
        }

        
    }
    
    @IBAction func logIn(sender: AnyObject) {
        
        // Parse original Login Function!!!
        PFUser.logInWithUsernameInBackground(username.text!, password: password.text!, block: { (user, error) -> Void in
            
            self.activityIndicator.stopAnimating()
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if user != nil {
                
                // LOGGED IN SUCCESSFULLY!!
                print("Login Successful")
                
                //SEGUE TO View4      ***************************************
                let vc : AnyObject! = self.storyboard!.instantiateViewControllerWithIdentifier("PolicyViewController")
                self.showViewController(vc as! UIViewController, sender: vc)
                
            } else {
                
                if let errorString = error!.userInfo["error"] as? String {
                    
                    self.errorMessage = errorString
                    
                }
                
                self.displayAlert("Failed Login", message: self.errorMessage)
                
            }
            
        })
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        username.resignFirstResponder()
        password.resignFirstResponder()
        
        return true
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
