//
//  AppDelegate.swift
//  Deltna
//
//  Created by Mohammad on 8/16/22.
//

import UIKit
import GoogleMaps
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics



@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       // Analytics.setAnalyticsCollectionEnabled(false)
        FirebaseApp.configure()
        //FirebaseApp.app()?.isDataCollectionDefaultEnabled = false
        GMSServices.provideAPIKey("AIzaSyA5aybBw9krXqyAvIcfPbYDNzR4WVy0Ytw")
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    

}

extension String {
    var localizedT: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension UIButton {
    @IBInspectable var localizedTitle: String {
        get { return "" }
        set {
            self.setTitle(newValue.localizedB, for: .normal)
        }
    }
}

extension String {
    var localizedB: String {
        get { return NSLocalizedString(self, comment: "") }
    }
}


