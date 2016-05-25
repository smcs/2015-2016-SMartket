//
//  CustomCell.swift
//  ParseStarterProject-Swift
//
//  Created by David Baek on 5/25/16.
//  Copyright © 2016 Parse. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet var Name: UILabel!
    @IBOutlet var Condition: UILabel!
    @IBOutlet var Price: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
