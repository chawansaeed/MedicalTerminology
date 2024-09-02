//
//  AboutUsViewController.swift
//  MTerm
//
//  Created by Chawan Saeed on 8/8/24.
//  Copyright © 2024 Chawan Saeed. All rights reserved.
//

import UIKit
import SafariServices

class AboutUsViewController: UIViewController {

    @IBOutlet var aboutLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//         let url = NSURL(string: "https/://www.indeed.com/career-advice/career-development/basic-medical-terminology-list")
//        
//            let safariController = SFSafariViewController(URL: url!)
//            presentViewController(safariController, animated: true, completion: nil)
        
        
        aboutLabel.text = "Medical Terms is an iOS application built for students studying in all medical or health care fields including a nyone or workers in the field." +
     "There are a list of medical terms that the user can tap to see what they mean." +
        
        "This application was built solely by a Pharm.D second stage student named “Chawan Khalid Saeed” in Kurdistan, Iraq." +
        
        "You can help me through following me in my social medias linked in the second tab" +
        "We used these websites for reference and more medical information:" +
    "https://www.indeed.com/career-advice/career-development/basic-medical-terminology-list"
        
    }
}
