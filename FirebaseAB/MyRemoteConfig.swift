//
//  RemoteConfig.swift
//  firebaseTest
//
//  Created by Iyad Tamer Agha on 23.09.17.
//  Copyright © 2017 Iyad Tamer Agha. All rights reserved.
//

import Foundation
import Firebase

class MyRemoteConfig{
    static let sharedInstance = MyRemoteConfig()
    var loadingDoneCallback: (() -> ())?
    var fetchComplete: Bool = false
    private init() {
        fetchRemoteValues()
    }
    
    func fetchRemoteValues() {
        let remoteConfigSettings = RemoteConfigSettings(developerModeEnabled: true)
        RemoteConfig.remoteConfig().configSettings = remoteConfigSettings!
        //remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
        var expirationDuration = 3600
        // If your app is using developer mode, expirationDuration is set to 0, so each fetch will
        // retrieve values from the service.
        if RemoteConfig.remoteConfig().configSettings.isDeveloperModeEnabled {
            expirationDuration = 0
        }
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: TimeInterval(expirationDuration)) { (status, error) -> Void in
            if status == .success {
                print("Config fetched!")
                RemoteConfig.remoteConfig().activateFetched()
                
                self.fetchComplete = true
                self.loadingDoneCallback?()
                
            } else {
                print("Config not fetched")
                print("Error \(error!.localizedDescription)")
            }
        }
    }
}
