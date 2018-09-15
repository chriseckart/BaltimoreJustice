//
//  EditYourInfoTableViewCell.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/12/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit

class EditYourInfoTableViewCell: UITableViewCell {
        
    // MARK: Properties
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var editInfoTextField: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
