//
//  OfficerPatrolDetailsViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 12/28/16.
//  Copyright © 2016 Christopher Eckart. All rights reserved.
//

import UIKit

class OfficerPatrolDetailsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var PatrolCarNumberTextField: UITextField!
    @IBOutlet weak var LicensePlateTextField: UITextField!
    @IBOutlet weak var OtherPatrolDetailsTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        PatrolCarNumberTextField.delegate = self
        LicensePlateTextField.delegate = self
        OtherPatrolDetailsTextField.delegate = self
        
        // Hide keyboard if background is touched
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(OfficerPatrolDetailsViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    // Hide keyboard if background is touched
    func didTapView(){
        self.view.endEditing(true)
    }
}
