//
//  ViewController.swift
//  firebaseTest
//
//  Created by Iyad Tamer Agha on 22.09.17.
//  Copyright © 2017 Iyad Tamer Agha. All rights reserved.
//

import UIKit
import Firebase

class ButtonViewController: UIViewController {

    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let decision = RemoteConfig.remoteConfig()["niceButton"].stringValue!
        Analytics.setUserProperty(decision, forName: "experimentGroup")
        
        if(decision == "orangeButton"){
            Button.backgroundColor = UIColor.orange
        }else{
            Button.backgroundColor = UIColor.blue
        }
        Analytics.logEvent("buttonShown", parameters: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

