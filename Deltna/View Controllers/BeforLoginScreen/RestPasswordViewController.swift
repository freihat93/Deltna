//
//  RestPasswordViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/20/22.
//

import UIKit
import Firebase

class RestPasswordViewController: UIViewController {

    @IBOutlet weak var restTitle: UILabel!
    @IBOutlet weak var restSubTitle: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    
    @IBOutlet weak var emailError: UILabel!
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
        restTitle.text = "restTitle".localizedT
        restSubTitle.text = "restSubTitle".localizedT
        emailTextField.placeholder = "Email".localizedT
        sendButton.localizedTitle = "send".localizedB
     
        
       
    }
    func EmailVerification() -> String?{
        if emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            self.emailError.text = "emailError".localizedT
            //"E-mail is Emtey"
        }
        return nil
    }

    func setUpElements() {
    
        
        Utilities.styleTextField(emailTextField)
        
       
        Utilities.styleFilledButton(sendButton)
        
        
    }
    @IBAction func sendEmailButton(_ sender: Any) {
        
        self.EmailVerification()
        
        Auth.auth().currentUser?.sendEmailVerification { error in
            if let error = error {
                let alert = UIAlertController(title: "Error", message: error.localizedDescription , preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let alert = UIAlertController(title: "Hurray", message: "A password reset email has been send!" , preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
                
                let restPasswordTwoViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.restPasswordTwoViewController) as? RestPasswordTwoViewController
                
                self.view.window?.rootViewController = restPasswordTwoViewController
                self.view.window?.makeKeyAndVisible()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        let loginViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController
        
        self.view.window?.rootViewController = loginViewController
        self.view.window?.makeKeyAndVisible()
        
        
    }
    
}
