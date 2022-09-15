//
//  RestPasswordTwoViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/22/22.
//

import UIKit

class RestPasswordTwoViewController: UIViewController {

    @IBOutlet weak var restTwoTitle: UILabel!
    @IBOutlet weak var restTwoSubTitle: UILabel!
    @IBOutlet weak var codeTextField: UITextField!
    
    @IBOutlet weak var codeError: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
        restTwoTitle.text = "restTwoTitle".localizedT
        restTwoSubTitle.text = "restTwoSubTitle".localizedT
        codeTextField.placeholder = "code".localizedT
        enterButton.localizedTitle = "EnterCode".localizedB
        
       
    }
    func CodeVerification() -> String?{
        if codeTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            self.codeTextField.text = "codeError".localizedT
            //"E-mail is Emtey"
        }
        return nil
    }

    func setUpElements() {
        
    Utilities.styleTextField(codeTextField)
        
    Utilities.styleFilledButton(enterButton)

    }
    
    @IBAction func backButton(_ sender: Any) {
        self.CodeVerification()
        let restPasswordViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.restPasswordViewController) as? RestPasswordViewController
        
        self.view.window?.rootViewController = restPasswordViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}
