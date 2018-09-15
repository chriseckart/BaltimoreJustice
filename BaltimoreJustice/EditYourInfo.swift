//
//  EditYourInfo.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/12/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit


class EditYourInfo {
    
    //MARK: Properties
    
    var name: String
    var textFieldPlaceHolder: String?
    var textFieldText: String?
    
    //MARK: Initialization
    
    init?(name: String, textFieldPlaceHolder: String?, textFieldText: String) {
        
        // Initialize stored properties.
        self.name = name
        self.textFieldPlaceHolder = textFieldPlaceHolder
        self.textFieldText = textFieldText
    }
}
