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
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var confirmPasswordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
     
       
    }
    

    func setUpElements() {
        
    Utilities.styleTextField(newPasswordTextField)
        
    Utilities.styleTextField(confirmPasswordTextField)
        
    Utilities.styleFilledButton(changeButton)

    }
    @IBAction func backButton(_ sender: Any) {
        
        let restPasswordThreeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.restPasswordThreeViewController) as? RestPasswordTwoViewController
        
        self.view.window?.rootViewController = restPasswordThreeViewController
        self.view.window?.makeKeyAndVisible()
    }
   
    

func validateFields() -> String? {
    
   
    if newPasswordTextField.text! ==  "" {
        self.passwordError.text =
            "passwordError".localizedT
        //"Password is Emtey"
    }
    if confirmPasswordTextField.text! == "" {
        self.confirmPasswordError.text = "confirmPasswordError".localizedT
    }
   



    return nil
}

@IBAction func pass_act(_ sender: Any){
    let text = newPasswordTextField.text ?? ""
    if Utilities.isPasswordValid(text) {
        passwordError.text = "StrongPassword".localizedT
        passwordError.textColor = UIColor.green
    }else{
        passwordError.text = "Weakpassword".localizedT
        passwordError.textColor = UIColor.red
    }
}
@IBAction func comPass_act(_ sender: Any){
    let text = confirmPasswordTextField.text ?? ""
    if Utilities.isConfirmPasswordValid(text) {
        confirmPasswordError.text = "StrongPassword".localizedT
        confirmPasswordError.textColor = UIColor.green
    }else{
        confirmPasswordError.text = "Weakpassword".localizedT
        confirmPasswordError.textColor = UIColor.red
    }
    if newPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == confirmPasswordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) {
        self.passwordError.text = "PasswordMatch".localizedT
        self.confirmPasswordError.text = "PasswordMatch".localizedT
        self.passwordError.textColor = UIColor.green
        self.confirmPasswordError.textColor = UIColor.green
    }else{
        //self.passwordError.text = "PasswordDon'tMatch".localizedT
        self.confirmPasswordError.text = "PasswordDon'tMatch".localizedT
        self.passwordError.textColor = UIColor.red
        self.confirmPasswordError.textColor = UIColor.red
            }
}

    @IBAction func changeButton(_ sender: Any) {
        self.validateFields()
    }
    
}
