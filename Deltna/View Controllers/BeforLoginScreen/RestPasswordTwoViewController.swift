//
//  RestPasswordTwoViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/22/22.
//

import UIKit

class RestPasswordTwoViewController: UIViewController {

    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
     
       
    }
    

    func setUpElements() {
        
    Utilities.styleTextField(codeTextField)
        
    Utilities.styleFilledButton(enterButton)

    }
    

}
