//
//  ConfirmationTableViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/14/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit

class ConfirmationTableViewController: UITableViewController {

    // MARK: Properties
    
    var confirmationInfo = [YourInfo]()
    var personalInfo = [ExtraButtonsInfo]()
    var mediaInfo = [ExtraButtonsInfo]()
    
    var ACTUALNAME = ""
    var ACTUALEMAIL = ""
    var ACTUALPRIMARYPHONENUMBER = ""
    var ACTUALOTHERPHONENUMBER = ""
    var ACTUALSTREETADDRESS = ""
    var ACTUALCITY = ""
    var ACTUALCOUNTY = ""
    var ACTUALZIP = ""
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.delegate = self
        tableView.dataSource = self
        
        ACTUALNAME = defaults.string(forKey: "FINALNAME") as String! ?? ""
        ACTUALEMAIL = defaults.string(forKey: "FINALEMAIL") as String! ?? ""
        ACTUALPRIMARYPHONENUMBER = defaults.string(forKey: "FINALPRIMARYPHONENUMBER") as String! ?? ""
        ACTUALOTHERPHONENUMBER = defaults.string(forKey: "FINALOTHERPHONENUMBER") as String! ?? ""
        ACTUALSTREETADDRESS = defaults.string(forKey: "FINALSTREETADDRESS") as String! ?? ""
        ACTUALCITY = defaults.string(forKey: "FINALCITY") as String! ?? ""
        ACTUALCOUNTY = defaults.string(forKey: "FINALCOUNTY") as String! ?? ""
        ACTUALZIP = defaults.string(forKey: "FINALZIP") as String! ?? ""

        print("the value of ACTUALNAME on confirm screen is ", ACTUALNAME)
        
        confirmationInfo.removeAll()
        LoadConfirmationInfo()
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        LoadConfirmationInfo()
        LoadExtraCells()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0){
            return confirmationInfo.count
        }else{
            return 1
        }
    }
    
    // MARK: Media Info Drawer selected, Personal Info Drawer selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
            
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "ConfirmReportInfoTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? YourInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ConfirmReportInfoTableViewCell.")
            }
            // Fetches the appropriate cell for the data source layout.
            
            cell.titleLabel?.text = confirmationInfo[indexPath.row].name
            cell.detailLabel?.text = confirmationInfo[indexPath.row].detail
            
            return cell
            
        }else if (indexPath.section == 1){
            
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "ConfirmPersonalInfoTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConfirmPersonalInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ConfirmPersonalInfoTableViewCell.")
            }
            // Fetches the appropriate cell for the data source layout.
            
            cell.titleLabel?.text = personalInfo[indexPath.row].name
            cell.detailLabel?.text = personalInfo[indexPath.row].detail
            cell.accessoryType = personalInfo[indexPath.row].accessoryType
            
            return cell
            
        }else{
            
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "ConfirmMediaTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ConfirmMediaTableViewCell  else {
                fatalError("The dequeued cell is not an instance of ConfirmMediaTableViewCell.")
            }
            // Fetches the appropriate cell for the data source layout.
            
            cell.titleLabel?.text = mediaInfo[indexPath.row].name
            cell.detailLabel?.text = mediaInfo[indexPath.row].detail
            cell.accessoryType = mediaInfo[indexPath.row].accessoryType
            
            return cell
            
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (section == 0) {
            return "Confirm this submission information."
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
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: Private Methods
    private func LoadConfirmationInfo() {
        // objects
        guard let ConfirmFullName = YourInfo(name: "Full Name", detail: ACTUALNAME)
            else{
                fatalError("Unable to instantiate ConfirmFullName")
        }
        guard let ConfirmEmailAddress = YourInfo(name: "Email Address", detail: ACTUALEMAIL)
            else{
                fatalError("Unable to instantiate ConfirmEmailAddress")
        }
        guard let ConfirmPrimaryPhoneNumber = YourInfo(name: "Primary Phone Number", detail: ACTUALPRIMARYPHONENUMBER)
            else{
                fatalError("Unable to instantiate ConfirmPrimaryPhoneNumber")
        }
        guard let ConfirmOtherPhoneNumber = YourInfo(name: "Other Phone Number", detail: ACTUALOTHERPHONENUMBER)
            else{
                fatalError("Unable to instantiate ConfirmOtherPhoneNumber")
        }
        guard let ConfirmStreetAddress = YourInfo(name: "Street Address", detail: ACTUALSTREETADDRESS)
            else{
                fatalError("Unable to instantiate ConfirmStreetAddress")
        }
        guard let ConfirmCity = YourInfo(name: "City", detail: ACTUALCITY)
            else{
                fatalError("Unable to instantiate ConfirmCity")
        }
        guard let ConfirmCounty = YourInfo(name: "County", detail: ACTUALCOUNTY)
            else{
                fatalError("Unable to instantiate ConfirmCounty")
        }
        guard let ConfirmZIPCode = YourInfo(name: "ZIP Code", detail: ACTUALZIP)
            else{
                fatalError("Unable to instantiate ConfirmZIPCode")
        }
        confirmationInfo += [ConfirmFullName,ConfirmEmailAddress,ConfirmPrimaryPhoneNumber,ConfirmOtherPhoneNumber,ConfirmStreetAddress,ConfirmCity,ConfirmCounty,ConfirmZIPCode]
    }
    
    private func LoadExtraCells() {
        guard let PersonalInformation = ExtraButtonsInfo(name: "Personal information", detail: "", accessoryType: .disclosureIndicator)
            else{
                fatalError("Unable to instantiate PersonalInformation")
        }
        guard let ExtraMedia = ExtraButtonsInfo(name: "Media images and video", detail: "", accessoryType: .disclosureIndicator)
            else{
                fatalError("Unable to instantiate ExtraMedia")
        }
        personalInfo += [PersonalInformation]
        mediaInfo += [ExtraMedia]
    }
    
    // MARK: Actions

    @IBAction func DoneButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "We have successfully received your submission.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        // Add here later, conditional for if the alert action is tapped, dismiss view and view 
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Segue out/pass data
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "InfoToEditSegue"{
//            let DestViewController = segue.destination as! UINavigationController
//            let TargetDestination = DestViewController.topViewController as! EditYourInfoTableViewController
//            print("InfoToEditSegue has been executed")
//            TargetDestination.EDITEDNAME = ACTUALNAME
//            TargetDestination.EDITEDEMAIL = ACTUALEMAIL
//            TargetDestination.EDITEDPRIMARYPHONENUMBER = ACTUALPRIMARYPHONENUMBER
//            TargetDestination.EDITEDOTHERPHONENUMBER = ACTUALOTHERPHONENUMBER
//            TargetDestination.EDITEDSTREETADDRESS = ACTUALSTREETADDRESS
//            TargetDestination.EDITEDCITY = ACTUALCITY
//            TargetDestination.EDITEDCOUNTY = ACTUALCOUNTY
//            TargetDestination.EDITEDZIP = ACTUALZIP
//            print("the value of ACTUALNAME is" , ACTUALNAME)
//            print("the value of ACTUALEMAIL is" , ACTUALEMAIL)
//        }
//    }
}
