//
//  ExtraButtonsInfo.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 2/3/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit

class ExtraButtonsInfo {
    
    //MARK: Properties
    
    var name: String
    var detail: String
    var accessoryType: UITableViewCellAccessoryType
    
    
    //MARK: Initialization
    
    init?(name: String, detail: String, accessoryType: UITableViewCellAccessoryType) {

        // Initialize stored properties.
        self.name = name
        self.detail = detail
        self.accessoryType = accessoryType
        
    }
}
