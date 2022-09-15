//
//  ProfileViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/25/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var farstNamefield: UITextField!
    
    @IBOutlet weak var lastNamefield: UITextField!
    
    @IBOutlet weak var phonetextfield: UITextField!
    
    @IBOutlet weak var deleteAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Profile".localizedT
        
        editButton.localizedTitle = "Edit".localizedB
        
        farstNamefield.text = "FirstName".localizedT
        
        lastNamefield.text = "LastName".localizedT
        
        phonetextfield.text = "Phone".localizedT
        
        deleteAccountButton.localizedTitle = "DeleteAccount".localizedB
        
    }
    
    @IBAction func backButton(_ sender: UIButton) {
//        let menuViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.menuViewController) as? MenuViewController
//
//        self.view.window?.rootViewController = menuViewController
//        self.view.window?.makeKeyAndVisible()
        
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
    }
}
