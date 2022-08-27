//
//  SettingViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/24/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SettingViewController: UIViewController {


    @IBOutlet weak var changeLangView: UIControl!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    @IBOutlet weak var CurrentLanguageLabel: UILabel!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var changePasswordButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoButton.localizedTitle  = ("Accountinfo".localizedB)
        
        changePasswordButton.localizedTitle = ( "ChangePassword".localizedB)
        
        languageLabel.text = "Language".localizedT
        
        logoutButton.localizedTitle = ("logout".localizedB)
        
        settingsLabel.text = "Settings".localizedT
        
        
        let currentLang = Locale.current.languageCode
        if currentLang == "en"{
        CurrentLanguageLabel.text = "Ar"
        }
        if currentLang == "ar"{
        CurrentLanguageLabel.text = "En"
        }
    }
    
//    @IBAction func ChangeLanguaheSegment(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0{
////            LocalizationSystem.sharedInstance.setLanguage(languageCode: "En")
////            UIView.appearance().semanticContentAttribute = .forceLeftToRight
//            let currentLang = Locale.current.languageCode
//            let newLanguage =  "en"
//            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
//
//        }else if sender.selectedSegmentIndex == 1{
////            LocalizationSystem.sharedInstance.setLanguage(languageCode: "Ar")
////            UIView.appearance().semanticContentAttribute = .forceRightToLeft
//            let currentLang = Locale.current.languageCode
//            let newLanguage =  "en"
//            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
//        }
//
//    }
//    
    @IBAction func changeLanguageView(_ sender: UIControl) {
        let currentLang = Locale.current.languageCode
        let newLanguage = currentLang == "en" ? "ar" : "en"
        changelanguageAlert("")
        UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
        if currentLang == "en" {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else if currentLang == "ar" {
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    
    
    func changelanguageAlert(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Email or Password is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            exit(0)
        } ))
        present(alert, animated: true)
        
    
    }
    @IBAction func backButton(_ sender: Any) {
        let tabBarViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarViewController) as? MenuViewController

        self.view.window?.rootViewController = tabBarViewController
        self.view.window?.makeKeyAndVisible()
    }
   
    @IBAction func logOutButton(_ sender: UIButton) {
    
    let firebaseAuth = Auth.auth()
 do {
   try firebaseAuth.signOut()
 } catch let signOutError as NSError {
   print("Error signing out: %@", signOutError)
 }
    }
}
