//
//  SellViewController.swift
//  SmartketUI2.0
//
//  Created by Jason Qian on 2/29/16.
//  Copyright © 2016 Jason Qian. All rights reserved.
//

import UIKit
import Parse
class SellViewController: UIViewController {
    var name :String = "name"
    var name1 : String = "passwords"
    
    @IBOutlet var NameOfItemTextField: UITextField!
    @IBOutlet var ISBNTextField: UITextField!
    @IBOutlet var ConditionOfItemTextField: UITextField!
    @IBOutlet var PriceOfItemTiextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func CreatingAnItme() {
        var Item = PFUser()
        Item.Name = NameOfItemTextField.text
        Item.ISBN = ISBNTextField.text
        Item.Condition = ConditionOfItemTextField.text
        Item.Price = PriceOfItemTextField.text
        
            
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
