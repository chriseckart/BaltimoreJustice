//
//  YourInfo.swift
//  BaltimoreJustice
//
//  Created by Jane Appleseed on 1/10/17.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit


class YourInfo {
    
    //MARK: Properties
    
    var name: String
    var detail: String

    
    //MARK: Initialization
    
    init?(name: String, detail: String) {

        // Initialize stored properties.
        self.name = name
        self.detail = detail
        
    }
}
