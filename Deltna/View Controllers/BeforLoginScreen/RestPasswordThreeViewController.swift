//
//  RestPasswordThreeViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/22/22.
//

import UIKit

class RestPasswordThreeViewController: UIViewController {

    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
     
       
    }
    

    func setUpElements() {
        
    Utilities.styleTextField(newPasswordTextField)
        
    Utilities.styleTextField(confirmPasswordTextField)
        
    Utilities.styleFilledButton(changeButton)

    }

}
