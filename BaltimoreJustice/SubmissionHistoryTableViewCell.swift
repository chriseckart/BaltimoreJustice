//
//  SubmissionHistoryTableViewCell.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/11/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit

class SubmissionHistoryTableViewCell: UITableViewCell {
    
    // MARK: Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
