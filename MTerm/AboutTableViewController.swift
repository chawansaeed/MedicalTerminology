//
//  AboutTableViewController.swift
//  MTerm
//
//  Created by Chawan Saeed on 8/8/24.
//  Copyright © 2024 Chawan Saeed. All rights reserved.
//

import UIKit
import SafariServices

class AboutTableViewController: UITableViewController {

    var sectionTitles = ["About Us", "Rate Us", "Follow Us"]
    var sectionContents = [["Who are we?"], ["Rate Us On AppStore"], ["Instagram", "Facebook", "Github", "Linked In"]]
    var links = ["https://www.instagram.com/chawan_saeed?igsh=MWFnbHh0aGF3ZjMzNg%3D%3D&utm_source=qr", "https://www.facebook.com/chawan.saeed.925", "https://github.com/chawansaeed", "https://www.linkedin.com/in/chawan-saeed-a27a9731b/"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionContents[section].count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "AboutCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        cell.textLabel?.text = sectionContents[indexPath.section][indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        switch indexPath.section {
            
        case 0:
            if indexPath.row == 0 {
            performSegueWithIdentifier("ShowAboutUs", sender: self)
        }
            
        case 1:
            if indexPath.row == 0 {
                if let url = NSURL(string: "http://www.apple.com/itunes/charts/paid-apps/") {
                UIApplication.sharedApplication().openURL(url)
                }
            }
            
        case 2:
            if let url = NSURL(string: links[indexPath.row]) {
                let safariController = SFSafariViewController(URL: url)
                presentViewController(safariController, animated: true, completion: nil)
            }
            
        default: break
    }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
    }
    
    
    
    
    
    
    
}
