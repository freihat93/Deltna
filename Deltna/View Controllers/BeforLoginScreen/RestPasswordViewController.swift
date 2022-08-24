//
//  RestPasswordViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/20/22.
//

import UIKit

class RestPasswordViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
     
        
       
    }
    

    func setUpElements() {
    
        
        Utilities.styleTextField(emailTextField)
        
       
        Utilities.styleFilledButton(sendButton)
        
        
    }

}
