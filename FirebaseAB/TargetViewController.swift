//
//  TargetViewController.swift
//  firebaseTest
//
//  Created by Iyad Tamer Agha on 22.09.17.
//  Copyright © 2017 Iyad Tamer Agha. All rights reserved.
//

import UIKit
import Firebase

class TargetViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.logEvent("targetScreenShown", parameters: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


