//
//  OfficerDetailsViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 12/28/16.
//  Copyright © 2016 Christopher Eckart. All rights reserved.
//

import UIKit

class OfficerDetailsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate{
    
    // MARK: Outlets and Variables
    
    var OFFICERNAME = ""
    var OFFICERSEX = ""
    var OFFICERRACE = ""
    var OFFICERAGE = ""
    var OFFICERHEIGHT = ""
    var OFFICERWEIGHT = ""
    var OFFICEREYECOLOR = ""
    
    @IBOutlet weak var OfficerNameTextField: UITextField!
    @IBOutlet weak var SexPicker: UIPickerView!
    @IBOutlet weak var RacePicker: UIPickerView!
    @IBOutlet weak var AgePicker: UIPickerView!
    @IBOutlet weak var HeightPicker: UIPickerView!
    @IBOutlet weak var WeightPicker: UIPickerView!
    @IBOutlet weak var EyeColorPicker: UIPickerView!
    
    
    let sexPickerData = ["Male","Female"]
    let racePickerData = ["White","Black","Middle Eastern","Asian","Native American"]
    let agePickerData = ["0","1","2","3","4","5","6"]
    let heightPickerData = ["tall","short"]
    let weightPickerData = ["skinny","fat"]
    let eyeColorPickerData = ["Brown","Blue","Green","Other"]
    let typePickerData = ["Abusive Language","Excessive Force","False Arrest","False Imprisonment","Harassment","Other"]
    let agencyPickerData = ["Police Department of Baltimore City","Baltimore City School Police","Housing Authority of Baltimore City Police","Baltimore City Sheriff's Department","Baltimore City Watershed Police Force","Police Force of the Baltimore City Community College","Police Force of Morgan State University"]

    
    
        //[18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        OfficerNameTextField.delegate = self
        SexPicker.delegate = self
        SexPicker.dataSource = self
        RacePicker.delegate = self
        RacePicker.dataSource = self
        AgePicker.delegate = self
        AgePicker.dataSource = self
        HeightPicker.delegate = self
        HeightPicker.dataSource = self
        WeightPicker.delegate = self
        WeightPicker.dataSource = self
        EyeColorPicker.delegate = self
        EyeColorPicker.dataSource = self
        
        // Hide keyboard if background is touched
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(OfficerDetailsViewController.didTapView))
        self.view.addGestureRecognizer(tapRecognizer)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("the value of OFFICERNAME is" , OFFICERNAME)
        print("the value of OFFICERSEX is" , OFFICERSEX)
        print("the value of OFFICERRACE is" , OFFICERRACE)
        print("the value of OFFICERAGE is" , OFFICERAGE)
        print("the value of OFFICERHEIGHT is" , OFFICERHEIGHT)
        print("the value of OFFICERWEIGHT is" , OFFICERWEIGHT)
        print("the value of OFFICEREYECOLOR is" , OFFICEREYECOLOR)

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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        OFFICERNAME = textField.text!
        print("the value of OFFICERNAME is" , OFFICERNAME)
        defaults.set(OFFICERNAME, forKey: "FINALOFFICERNAME")

    }
    
    // MARK: Picker Delegates and Data Sources
    
    // Number of columns in picker is 1
    func numberOfComponents(in:UIPickerView) -> Int {
        return 1
    }
    
    // MARK: Data Sources
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView.tag == 1){
            return sexPickerData.count
        }else if (pickerView.tag == 2){
            return racePickerData.count
        }else if (pickerView.tag == 3){
            return agePickerData.count
        }else if (pickerView.tag == 4){
            return heightPickerData.count
        }else if (pickerView.tag == 5){
            return weightPickerData.count
        }else if (pickerView.tag == 6){
            return eyeColorPickerData.count
        }else if (pickerView.tag == 7){
            return typePickerData.count
        }else{
            return agencyPickerData.count
        }
    }
    
    // MARK: Delegates
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView.tag == 1){
            return sexPickerData[row]
        }else if (pickerView.tag == 2){
            return racePickerData[row]
        }else if (pickerView.tag == 3){
            return agePickerData[row]
        }else if (pickerView.tag == 4){
            return heightPickerData[row]
        }else if (pickerView.tag == 5){
            return weightPickerData[row]
        }else if (pickerView.tag == 6){
            return eyeColorPickerData[row]
        }else if (pickerView.tag == 7){
            return typePickerData[row]
        }else{
            return agencyPickerData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView.tag == 1){
            OFFICERSEX = sexPickerData[row]
            print("the value of OFFICERSEX is" , OFFICERSEX)
            defaults.set(OFFICERSEX, forKey: "FINALOFFICERSEX")

        }else if (pickerView.tag == 2){
            OFFICERRACE = racePickerData[row]
            print("the value of OFFICERRACE is" , OFFICERRACE)
            defaults.set(OFFICERRACE, forKey: "FINALOFFICERRACE")

        }else if (pickerView.tag == 3){
            OFFICERAGE = agePickerData[row]
            print("the value of OFFICERAGE is" , OFFICERAGE)
            defaults.set(OFFICERAGE, forKey: "FINALOFFICERAGE")

        }else if (pickerView.tag == 4){
            OFFICERHEIGHT = heightPickerData[row]
            print("the value of OFFICERHEIGHT is" , OFFICERHEIGHT)
            defaults.set(OFFICERHEIGHT, forKey: "FINALOFFICERHEIGHT")

        }else if (pickerView.tag == 5){
            OFFICERWEIGHT = weightPickerData[row]
            print("the value of OFFICERWEIGHT is" , OFFICERWEIGHT)
            defaults.set(OFFICERWEIGHT, forKey: "FINALOFFICERWEIGHT")

        }else{
            OFFICEREYECOLOR = eyeColorPickerData[row]
            print("the value of OFFICEREYECOLOR is" , OFFICEREYECOLOR)
            defaults.set(OFFICEREYECOLOR, forKey: "FINALOFFICEREYECOLOR")

        }
    }

    //MARK: Actions
    
    @IBAction func cancelReport(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
