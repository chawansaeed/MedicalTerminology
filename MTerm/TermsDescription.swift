//
//  TermsDescription.swift
//  MTerm
//
//  Created by Chawan Saeed on 8/7/24.
//  Copyright © 2024 Chawan Saeed. All rights reserved.
//

import UIKit

class TermsDescription: UIViewController {

    @IBOutlet var termsName: UILabel!
    @IBOutlet var termDescription: UILabel!
    @IBOutlet var buttomInfo: UILabel!
    
    var termsDetails: Information!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttomInfo.text = "2024 - Chawan Saeed"
        termsName.text = termsDetails.medicalTerm
        termDescription.text = termsDetails.mTermMeaning
        
    }
    
}
