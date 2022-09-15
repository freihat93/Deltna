//
//  AboutUsViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/25/22.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fqaButton: UIButton!
    
    @IBOutlet weak var privacyButton: UIButton!
    
    @IBOutlet weak var termsButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "AboutUs".localizedT
        
        fqaButton.localizedTitle = "FAQ".localizedB
        
        privacyButton.localizedTitle = "PrivacyPolicy".localizedB
        
        termsButton.localizedTitle = "TermsOfUse".localizedB
    }
    
    @IBAction func backButton(_ sender: UIButton) {
//        let menuViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.menuViewController) as? MenuViewController
//
//        self.view.window?.rootViewController = menuViewController
//        self.view.window?.makeKeyAndVisible()
        
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
   

}
