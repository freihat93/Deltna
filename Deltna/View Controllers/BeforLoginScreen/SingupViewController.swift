//
//  SingupViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/20/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore



class SingupViewController: UIViewController {

    @IBOutlet weak var firstNameTextFeield: UITextField!
    @IBOutlet weak var lastNameTextFeield: UITextField!
    @IBOutlet weak var emailTextFeield: UITextField!
    @IBOutlet weak var phoneTextFeield: UITextField!
    @IBOutlet weak var passwordTextFeield: UITextField!
    @IBOutlet weak var confirmPasswordTextFeield: UITextField!
    @IBOutlet weak var createButton: UIButton!
    
    @IBOutlet weak var firstNameError: UILabel!
    @IBOutlet weak var lastNameError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var confirmPasswordError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        
     
        
       
    }
    

    func setUpElements() {
    
        
        Utilities.styleTextField(firstNameTextFeield)
        
        Utilities.styleTextField(lastNameTextFeield)
        
        Utilities.styleTextField(emailTextFeield)
        
        Utilities.styleTextField(phoneTextFeield)
        
        Utilities.styleTextField(passwordTextFeield)
        
        Utilities.styleTextField(confirmPasswordTextFeield)
       
        Utilities.styleFilledButton(createButton)
    }

    func validateFields() -> String? {
        
        //Text field not emty
        if firstNameTextFeield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            firstNameError.text = "Please fill"
        }else{
            firstNameError.text = ""
        }
        if lastNameTextFeield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            lastNameError.text = "Please l"
        }else{
            lastNameError.text = ""
        }
        if phoneTextFeield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            phoneError.text = "Please ph"
        }else{
            phoneError.text = ""
        }
        if emailTextFeield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            emailError.text = "Please e"
        }else{
            emailError.text = ""
        }
        if passwordTextFeield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            passwordError.text = "Please ph"
        }else{
            passwordError.text = ""
        }
        if confirmPasswordTextFeield.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            confirmPasswordError.text = "Please e"
        }else{
            confirmPasswordError.text = ""
        }
        if passwordTextFeield != confirmPasswordTextFeield {
            self.MatchPasswordAlert("")
        }
        
        //password req
        let cleanedPassword = passwordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            self.PasswordValidAlert("")
        }
        
        
        
        return nil
    }
    
    @IBAction func createTapped(_ sender: Any) {
       
        //Validate the field
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
        
        }
        else{
            let firstName = firstNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let lastName = lastNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let phoneNumber = phoneTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let password = firstNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            Auth.auth().createUser(withEmail: email, password: password){ (result, err) in
              
              
            
                
                if err != nil {
                    
                    self.showErrorAlertCreate("")
                    
                }
                else{
                    
                    let db = Firestore.firestore()
                    
                    
                    db.collection("users").addDocument(data: ["farstNmae":firstName,"lastNmae" :lastName,"phoneNumber":phoneNumber,"uid" : result!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showErrorAlertDB("")
                        }
                        
                    }
                    //self.transitionToHome(Sender: )
                }
                
            }
            
        }
        
    }
    func showErrorAlertCreate(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Error creating user", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }
    func showErrorAlertDB(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Error db", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }
    func MatchPasswordAlert(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Password don't match. Please try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }
    func PasswordValidAlert(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Please make sure your password at lest 8 chatacters, contains a special character and a number.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }
    func CompleteCreateUserAlert(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Created Successfully.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }
    func showError(_ message: String){
        firstNameError.text = message
        firstNameError.alpha = 1
        
        lastNameError.text = message
        lastNameError.alpha = 1
        
        emailError.text = message
        emailError.alpha = 1
        
        phoneError.text = message
        phoneError.alpha = 1
        
        passwordError.text = message
        passwordError.alpha = 1
        
        confirmPasswordError.text = message
        confirmPasswordError.alpha = 1
    }
    
    func transitionToHome(Sender: UIButton!) {
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()

    }
    
}
