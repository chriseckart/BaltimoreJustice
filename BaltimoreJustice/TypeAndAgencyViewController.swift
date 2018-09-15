//
//  OfficerDetailsViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/9/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit

class TypeAndAgencyViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    // MARK: Outlets and Variables
    
    var INCIDENTTYPE = ""
    var INCIDENTAGENCY = ""
    
    @IBOutlet weak var TypePicker: UIPickerView!
    @IBOutlet weak var AgencyPicker: UIPickerView!
    
    
    let typePickerData = ["Abusive Language","Excessive Force","False Arrest","False Imprisonment","Harassment","Other"]
    let agencyPickerData = ["Police Department of Baltimore City","Baltimore City School Police","Housing Authority of Baltimore City Police","Baltimore City Sheriff's Department","Baltimore City Watershed Police Force","Police Force of the Baltimore City Community College","Police Force of Morgan State University"]
    
    
    
    //[18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        TypePicker.delegate = self
        TypePicker.dataSource = self
        AgencyPicker.delegate = self
        AgencyPicker.dataSource = self
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("the value of INCIDENTTYPE is ", INCIDENTTYPE)
        print("the value of INCIDENTAGENCY is ", INCIDENTAGENCY)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: Picker Delegates and Data Sources
    
    // Number of columns in picker is 1
    func numberOfComponents(in:UIPickerView) -> Int {
        return 1
    }
    
    // MARK: Data Sources
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 7){
            return typePickerData.count
        }else{
            return agencyPickerData.count
        }
    }
    
    // MARK: Picker titles
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 7){
            return typePickerData[row]
        }else{
            return agencyPickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 7){
            INCIDENTTYPE = typePickerData[row]
            print("the value of INCIDENTTYPE is ", INCIDENTTYPE)
            defaults.setValue(INCIDENTTYPE, forKey: "FINALTYPE")
        }else{
            INCIDENTAGENCY = agencyPickerData[row]
            print("the value of INCIDENTAGENCY is ", INCIDENTAGENCY)
            defaults.setValue(INCIDENTAGENCY, forKey: "FINALAGENCY")
        }
    }
    
    //MARK: Actions
    
}
