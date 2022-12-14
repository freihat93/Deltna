//
//  MenuViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/25/22.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuLabel: UILabel!
    
    @IBOutlet weak var profileButton: UIButton!
    
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var getHelpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileButton.localizedTitle = "Profile".localizedB
        
        aboutButton.localizedTitle = "AboutUs".localizedB
        
        menuLabel.text = "Menu".localizedT
        
        getHelpButton.localizedTitle = "GetHelp".localizedB
    }
    

    @IBAction func settingButton(_ sender: UIButton) {
//        let settingsViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.settingsViewController) as? SettingViewController
//
//        self.view.window?.rootViewController = settingsViewController
//        self.view.window?.makeKeyAndVisible()
        
       
        let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.settingsViewController) as!
            SettingViewController

        self.navigationController?.pushViewController(settingViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    
    }
   
    
    
    @IBAction func goToProfile(_ sender: UIButton) {
        
//        let prfileViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.prfileViewController) as? ProfileViewController
//
//        self.view.window?.rootViewController = prfileViewController
//        self.view.window?.makeKeyAndVisible()
        
        let profileViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.profileViewController) as!
            ProfileViewController

        self.navigationController?.pushViewController(profileViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        
    }
    
    
    @IBAction func goToAbout(_ sender: UIButton) {
//        let aboutViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.aboutViewController) as? AboutUsViewController
//
//        self.view.window?.rootViewController = aboutViewController
//        self.view.window?.makeKeyAndVisible()
        
        let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.aboutViewController) as!
            AboutUsViewController

        self.navigationController?.pushViewController(aboutViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBAction func goToHelp(_ sender: UIButton) {
//        let menuViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.menuViewController) as? MenuViewController
//
//        self.view.window?.rootViewController = menuViewController
//        self.view.window?.makeKeyAndVisible()
        
        let aboutViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.aboutViewController) as!
            AboutUsViewController

        self.navigationController?.pushViewController(aboutViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }

}
