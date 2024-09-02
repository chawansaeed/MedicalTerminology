//
//  MedicalTermsTableViewController.swift
//  MTerm
//
//  Created by Chawan Saeed on 7/27/24.
//  Copyright © 2024 Chawan Saeed. All rights reserved.
//

import UIKit

class MedicalTermsTableViewController: UITableViewController, UISearchBarDelegate {  
    
    var informations = [Information]()
    @IBOutlet var numberOfItems: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Medical Terms"
        readJsonFile("TermsJsonData")
        numberOfItems.text = "\(informations.count) terms in total"
        numberOfItems.textColor = UIColor.lightGrayColor()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
 
// For showing the order of the sections on the right side of the view:
//    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
//        return ...
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return informations.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MedicalTermsTableViewCell
        cell.mTermLabel.textColor = UIColor.blackColor()
        cell.mTermLabel.font = UIFont(name: "Helvetica", size: 17.0)
        cell.mTermLabel.text = informations[indexPath.row].medicalTerm
        
        cell.termType.textColor = UIColor.lightGrayColor()
        cell.termType.font = UIFont(name: "Helvetica", size: 16.0)
        cell.termType.text = informations[indexPath.row].termType
        
       return cell
    }

    
    func readJsonFile(path: String) {
        if let filePath = NSBundle.mainBundle().pathForResource(path, ofType: "json") {
            let data = NSData(contentsOfFile: filePath)
            parseJsonFile(data!)
        }
    }
    func parseJsonFile(data: NSData) -> [Information] {
        do {
            let decodedData = try NSJSONSerialization.JSONObjectWithData(data, options: [ ]) as? NSDictionary
            
            //Parse Json data
            let jsonDatas = decodedData?["MedicalTerms"] as! [AnyObject]
            
            for jsonData in jsonDatas {
                let information = Information()
                information.medicalTerm = jsonData["medicalTerm"] as! String
                information.mTermMeaning = jsonData["termMeaning"] as! String
                information.mTermPronounciation = jsonData["pronounciation"] as! String
                information.termType = jsonData["type"] as! String
                informations.append(information)
            }
        } catch { "Could not parse data, the problem is: \(error)" }
        return informations
    }
 
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "description" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationVC = segue.destinationViewController as! TermsDescription
                
                destinationVC.termsDetails = informations[indexPath.row]
                destinationVC.hidesBottomBarWhenPushed = true
                destinationVC.title = "Medical Terms"
            }
        }
    }
}