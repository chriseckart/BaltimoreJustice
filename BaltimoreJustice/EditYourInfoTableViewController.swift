//
//  EditYourInfoTableViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/12/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit
import os.log

class EditYourInfoTableViewController: UITableViewController, UITextFieldDelegate {
    
    // MARK: Properties
    
    
    
    var editInformation = [EditYourInfo]()
    
    var EDITEDNAME = defaults.string(forKey: "FINALNAME") as String! ?? ""
    var EDITEDEMAIL = defaults.string(forKey: "FINALEMAIL") as String! ?? ""
    var EDITEDPRIMARYPHONENUMBER = defaults.string(forKey: "FINALPRIMARYPHONENUMBER") as String! ?? ""
    var EDITEDOTHERPHONENUMBER = defaults.string(forKey: "FINALOTHERPHONENUMBER") as String! ?? ""
    var EDITEDSTREETADDRESS = defaults.string(forKey: "FINALSTREETADDRESS") as String! ?? ""
    var EDITEDCITY = defaults.string(forKey: "FINALCITY") as String! ?? ""
    var EDITEDCOUNTY = defaults.string(forKey: "FINALCOUNTY") as String! ?? ""
    var EDITEDZIP = defaults.string(forKey: "FINALZIP") as String! ?? ""
    
    // MARK: Navigation
   
    // This method lets you configure a view controller before it's presented.
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
                        
        editInformation.removeAll()
        LoadEditInfo()
        self.tableView.reloadData()
        
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        LoadEditInfo()
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Table view data source/details (sections etc)
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return editInformation.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "EditYourInfoTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? EditYourInfoTableViewCell  else {
            fatalError("The dequeued cell is not an instance of EditYourInfoTableViewCell.")
        }
        // Fetches the appropriate cell for the data source layout.
        let editedInformationLOCAL = editInformation[indexPath.row]
        
        cell.editInfoTextField.delegate = self
        
        cell.titleLabel?.text = editedInformationLOCAL.name
        cell.editInfoTextField.placeholder = editedInformationLOCAL.textFieldPlaceHolder
        cell.editInfoTextField?.text = editedInformationLOCAL.textFieldText
        
        cell.editInfoTextField.tag = indexPath.row
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (section == 0) {
            return "Edit current information."
        }else{
            return nil
        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    

    // MARK: Private Methods
    private func LoadEditInfo() {
        // objects
        guard let EditFullName = EditYourInfo(name: "Full Name", textFieldPlaceHolder: "Enter your full name", textFieldText: EDITEDNAME)
            else{
                fatalError("Unable to instantiate EditFullName")
        }
        guard let EditEmailAddress = EditYourInfo(name: "Email Address", textFieldPlaceHolder: "Enter your email address", textFieldText: EDITEDEMAIL)
            else{
                fatalError("Unable to instantiate EditEmailAddress")
        }
        guard let EditPrimaryPhoneNumber = EditYourInfo(name: "Primary Phone Number", textFieldPlaceHolder: "Enter your primary phone number", textFieldText: EDITEDPRIMARYPHONENUMBER)
            else{
                fatalError("Unable to instantiate EditPrimaryPhoneNumber")
        }
        guard let EditOtherPhoneNumber = EditYourInfo(name: "Other Phone Number", textFieldPlaceHolder: "Enter your other phone number", textFieldText: EDITEDOTHERPHONENUMBER)
            else{
                fatalError("Unable to instantiate EditOtherPhoneNumber")
        }
        guard let EditStreetAddress = EditYourInfo(name: "Street Address", textFieldPlaceHolder: "Enter your street address", textFieldText: EDITEDSTREETADDRESS)
            else{
                fatalError("Unable to instantiate EditStreetAddress")
        }
        guard let EditCity = EditYourInfo(name: "City", textFieldPlaceHolder: "Enter your city", textFieldText: EDITEDCITY)
            else{
                fatalError("Unable to instantiate EditCity")
        }
        guard let EditCounty = EditYourInfo(name: "County", textFieldPlaceHolder: "Enter your county", textFieldText: EDITEDCOUNTY)
            else{
                fatalError("Unable to instantiate EditCounty")
        }
        guard let EditZIPCode = EditYourInfo(name: "ZIP Code", textFieldPlaceHolder: "Enter your ZIP Code", textFieldText: EDITEDZIP)
            else{
                fatalError("Unable to instantiate EditZIPCode")
        }
        
        editInformation += [EditFullName,EditEmailAddress,EditPrimaryPhoneNumber,EditOtherPhoneNumber,EditStreetAddress,EditCity,EditCounty,EditZIPCode]

    }
    
    // MARK: Actions

    @IBAction func saveEditInfo(_ sender: Any) {
        performSegue(withIdentifier: "unwindToInfo", sender: self)
    }
    
    @IBAction func cancelEditInfo(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.tag == 0){
            textField.keyboardType = .default
        }else if (textField.tag == 1){
            textField.keyboardType = .emailAddress
        }else if (textField.tag == 2){
            textField.keyboardType = .phonePad
        }else if (textField.tag == 3){
            textField.keyboardType = .phonePad
        }else if (textField.tag == 4){
            textField.keyboardType = .default
        }else if (textField.tag == 5){
            textField.keyboardType = .default
        }else if (textField.tag == 6){
            textField.keyboardType = .default
        }else{
            textField.keyboardType = .numberPad
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if (textField.tag == 0){
            EDITEDNAME = textField.text!
            print("the value of EDITEDNAME is" , EDITEDNAME)
            defaults.set(EDITEDNAME, forKey: "FINALNAME")
            
        }else if (textField.tag == 1){
            EDITEDEMAIL = textField.text!
            print("the value of EDITEDEMAIL is" , EDITEDEMAIL)
            defaults.set(EDITEDEMAIL, forKey: "FINALEMAIL")
            
        }else if (textField.tag == 2){
            EDITEDPRIMARYPHONENUMBER = textField.text!
            print("the value of EDITEDPRIMARYPHONENUMBER is" , EDITEDPRIMARYPHONENUMBER)
            defaults.set(EDITEDPRIMARYPHONENUMBER, forKey: "FINALPRIMARYPHONENUMBER")

        }else if (textField.tag == 3){
            EDITEDOTHERPHONENUMBER = textField.text!
            print("the value of EDITEDOTHERPHONENUMBER is" , EDITEDOTHERPHONENUMBER)
            defaults.set(EDITEDOTHERPHONENUMBER, forKey: "FINALOTHERPHONENUMBER")

        }else if (textField.tag == 4){
            EDITEDSTREETADDRESS = textField.text!
            print("the value of EDITEDSTREETADDRESS is" , EDITEDSTREETADDRESS)
            defaults.set(EDITEDSTREETADDRESS, forKey: "FINALSTREETADDRESS")

        }else if (textField.tag == 5){
            EDITEDCITY = textField.text!
            print("the value of EDITEDCITY is" , EDITEDCITY)
            defaults.set(EDITEDCITY, forKey: "FINALCITY")

        }else if (textField.tag == 6){
            EDITEDCOUNTY = textField.text!
            print("the value of EDITEDCOUNTY is" , EDITEDCOUNTY)
            defaults.set(EDITEDCOUNTY, forKey: "FINALCOUNTY")

        }else{
            EDITEDZIP = textField.text!
            print("the value of EDITEDZIP is" , EDITEDZIP)
            defaults.set(EDITEDZIP, forKey: "FINALZIP")

        }
    }
    
// MARK: UPDATE, expand this later, perhaps add a checkbox that is like, "yep you are ready to submit an official report" vs an x for "nope, you gotta add all your valid info first"
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if textField.text ?.contains(<#T##other: String##String#>){
//            return false
//        }else{
//            return true
//        }
//    }
    
    // MARK: Segue out/pass data
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "unwindToInfo"{
//            if let destination = segue.destination as? YourInfoTableViewController{
//                print("unwindToInfo has been executed")
//                destination.ACTUALNAME = EDITEDNAME
//                destination.ACTUALEMAIL = EDITEDEMAIL
//                destination.ACTUALPRIMARYPHONENUMBER = EDITEDPRIMARYPHONENUMBER
//                destination.ACTUALOTHERPHONENUMBER = EDITEDOTHERPHONENUMBER
//                destination.ACTUALSTREETADDRESS = EDITEDSTREETADDRESS
//                destination.ACTUALCITY = EDITEDCITY
//                destination.ACTUALCOUNTY = EDITEDCOUNTY
//                destination.ACTUALZIP = EDITEDZIP
//            }
//        }
//    }
}
