//
//  SellViewController.swift
//  SmartketUI2.0
//
//  Created by Jason Qian on 2/29/16.
//  Copyright © 2016 Jason Qian. All rights reserved.
//

import Parse
import UIKit

@available(iOS 8.0, *)
class SellViewController: UIViewController {

    @IBOutlet var name: UITextField!
    @IBOutlet var isbn: UITextField!
    @IBOutlet var condition: UITextField!
    @IBOutlet var amount: UITextField!
    
    
    @IBAction func confirmButton(sender: AnyObject) {
        // saving to Parse!!!
        
        let item = PFObject(className: "Data")
        
        item["name"] = name.text
        item["price"] = amount.text
        item["condition"] = condition.text
        item["ISBN"] = isbn.text
        
        item.saveInBackgroundWithBlock {
        (success: Bool, error: NSError?) -> Void in
            if (success) {
        
                // add to BuyViewController TableList
                
                
                let alertController = UIAlertController(title: "Upload Successful", message: "You have successfully uploaded your item onto the list", preferredStyle: UIAlertControllerStyle.Alert)
                
                alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) -> Void in
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    
                   
                 
                }))
                    
                    
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
        
            } else {
                error!.description
            }
        }

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        name.resignFirstResponder()
        isbn.resignFirstResponder()
        condition.resignFirstResponder()
        amount.resignFirstResponder()
        
        return true
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
