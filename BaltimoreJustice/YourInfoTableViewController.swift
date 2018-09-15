//
//  YourInfoTableViewController.swift
//  BaltimoreJustice
//
//  Created by Christopher Eckart on 1/10/17.
//  Copyright © 2017 Christopher Eckart. All rights reserved.
//

import UIKit


class YourInfoTableViewController: UITableViewController {

    // MARK: Properties
    
    var defaultInformation = [YourInfo]()
    var whyNeeded = [ExtraButtonsInfo]()
    var submissionHistory = [ExtraButtonsInfo]()

    var ACTUALNAME = defaults.string(forKey: "FINALNAME") as String! ?? ""
    var ACTUALEMAIL = defaults.string(forKey: "FINALEMAIL") as String! ?? ""
    var ACTUALPRIMARYPHONENUMBER = defaults.string(forKey: "FINALPRIMARYPHONENUMBER") as String! ?? ""
    var ACTUALOTHERPHONENUMBER = defaults.string(forKey: "FINALOTHERPHONENUMBER") as String! ?? ""
    var ACTUALSTREETADDRESS = defaults.string(forKey: "FINALSTREETADDRESS") as String! ?? ""
    var ACTUALCITY = defaults.string(forKey: "FINALCITY") as String! ?? ""
    var ACTUALCOUNTY = defaults.string(forKey: "FINALCOUNTY") as String! ?? ""
    var ACTUALZIP = defaults.string(forKey: "FINALZIP") as String! ?? ""

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
        
        defaultInformation.removeAll()
        LoadDefaultInfo()
        self.tableView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        LoadDefaultInfo()
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
            return defaultInformation.count
        }else{
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0){
          
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "YourInfoTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? YourInfoTableViewCell  else {
                fatalError("The dequeued cell is not an instance of YourInfoTableViewCell.")
            }
            // Fetches the appropriate cell for the data source layout.
            
            cell.titleLabel?.text = defaultInformation[indexPath.row].name
            cell.detailLabel?.text = defaultInformation[indexPath.row].detail
            
            return cell

        }else if (indexPath.section == 1){
        
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "WhyNeededTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WhyNeededTableViewCell  else {
                fatalError("The dequeued cell is not an instance of WhyNeededTableViewCell.")
            }
            // Fetches the appropriate cell for the data source layout.
            let whyNeededLOCAL = whyNeeded[indexPath.row]
            
            cell.titleLabel?.text = whyNeededLOCAL.name
            cell.detailLabel?.text = whyNeededLOCAL.detail
            cell.accessoryType = whyNeededLOCAL.accessoryType
            
            return cell

        }else{
        
            // Table view cells are reused and should be dequeued using a cell identifier.
            let cellIdentifier = "SubmissionHistoryTableViewCell"
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SubmissionHistoryTableViewCell  else {
                fatalError("The dequeued cell is not an instance of SubmissionHistoryTableViewCell.")
            }
            // Fetches the appropriate cell for the data source layout.
            let SubmissionHistoryLOCAL = submissionHistory[indexPath.row]
            
            cell.titleLabel?.text = SubmissionHistoryLOCAL.name
            cell.detailLabel?.text = SubmissionHistoryLOCAL.detail
            cell.accessoryType = SubmissionHistoryLOCAL.accessoryType
            
            return cell
            
        }
    }

    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if (section == 0) {
            return "Your current information."
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
    private func LoadDefaultInfo() {
        // objects
        guard let FullName = YourInfo(name: "Full Name", detail: ACTUALNAME)
            else{
                fatalError("Unable to instantiate FullName")
        }
        guard let EmailAddress = YourInfo(name: "Email Address", detail: ACTUALEMAIL)
            else{
                fatalError("Unable to instantiate EmailAddress")
        }
        guard let PrimaryPhoneNumber = YourInfo(name: "Primary Phone Number", detail: ACTUALPRIMARYPHONENUMBER)
            else{
                fatalError("Unable to instantiate PrimaryPhoneNumber")
        }
        guard let OtherPhoneNumber = YourInfo(name: "Other Phone Number", detail: ACTUALOTHERPHONENUMBER)
            else{
                fatalError("Unable to instantiate OtherPhoneNumber")
        }
        guard let StreetAddress = YourInfo(name: "Street Address", detail: ACTUALSTREETADDRESS)
            else{
                fatalError("Unable to instantiate StreetAddress")
        }
        guard let City = YourInfo(name: "City", detail: ACTUALCITY)
            else{
                fatalError("Unable to instantiate City")
        }
        guard let County = YourInfo(name: "County", detail: ACTUALCOUNTY)
            else{
                fatalError("Unable to instantiate County")
        }
        guard let ZIPCode = YourInfo(name: "ZIP Code", detail: ACTUALZIP)
            else{
                fatalError("Unable to instantiate ZIPCode")
        }
        defaultInformation += [FullName,EmailAddress,PrimaryPhoneNumber,OtherPhoneNumber,StreetAddress,City,County,ZIPCode]
    }
    
    private func LoadExtraCells() {
        guard let infoNeeded = ExtraButtonsInfo(name: "Why do we need your information?", detail: "", accessoryType: .detailButton)
            else{
                fatalError("Unable to instantiate infoNeeded")
        }
        guard let submitHistory = ExtraButtonsInfo(name: "Submission history", detail: "", accessoryType: .disclosureIndicator)
            else{
                fatalError("Unable to instantiate submissionHistory")
        }
        whyNeeded += [infoNeeded]
        submissionHistory += [submitHistory]
    }
    
    // MARK: Actions
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            let alert = UIAlertController(title: "Why do we need your information?", message: "Your information is needed whenever filing an official report to the Civilian Review Board. However, if you are filing an anonymous report, your information is not needed.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 3 && indexPath.row == 1) {
            
        }
    }
    
    
    // MARK: Segues (pass data)
    
    @IBAction func unwindToInfo(segue: UIStoryboardSegue) {}

    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == "InfoToEditSegue"{
//            let DestViewController = segue.destination as! UINavigationController
//            let TargetDestination = DestViewController.topViewController as! EditYourInfoTableViewController
//                print("InfoToEditSegue has been executed")
//                TargetDestination.EDITEDNAME = ACTUALNAME
//                TargetDestination.EDITEDEMAIL = ACTUALEMAIL
//                TargetDestination.EDITEDPRIMARYPHONENUMBER = ACTUALPRIMARYPHONENUMBER
//                TargetDestination.EDITEDOTHERPHONENUMBER = ACTUALOTHERPHONENUMBER
//                TargetDestination.EDITEDSTREETADDRESS = ACTUALSTREETADDRESS
//                TargetDestination.EDITEDCITY = ACTUALCITY
//                TargetDestination.EDITEDCOUNTY = ACTUALCOUNTY
//                TargetDestination.EDITEDZIP = ACTUALZIP
//        }
//    }
}
