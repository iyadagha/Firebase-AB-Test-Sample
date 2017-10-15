//
//  WaitingViewController.swift
//  firebaseTest
//
//  Created by Iyad Tamer Agha on 23.09.17.
//  Copyright © 2017 Iyad Tamer Agha. All rights reserved.
//

import UIKit

class WaitingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if MyRemoteConfig.sharedInstance.fetchComplete {
            jumpToFirstScreen()
        }
        
        MyRemoteConfig.sharedInstance.loadingDoneCallback = jumpToFirstScreen
    
    }
    
    func jumpToFirstScreen() {
        performSegue(withIdentifier: "startSegue", sender: self)
    }
}
