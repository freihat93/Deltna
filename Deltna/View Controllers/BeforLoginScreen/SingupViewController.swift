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
    @IBOutlet weak var loginHereButton: UIButton!
    
    @IBOutlet weak var titelCreatLabel: UILabel!
    @IBOutlet weak var subTitleCreatLabel: UILabel!
    @IBOutlet weak var firstNameError: UILabel!
    @IBOutlet weak var lastNameError: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var phoneError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var confirmPasswordError: UILabel!
    @IBOutlet weak var alreadyHaveAnAccont: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpElements()
        //setupTextFields()
        
        titelCreatLabel.text = "Let'sGetStarted".localizedT
        
        subTitleCreatLabel.text = "CreatAnAccontnt".localizedT
        
        firstNameTextFeield.placeholder = "FirstName".localizedT
        
        lastNameTextFeield.placeholder = "LastName".localizedT
        
        emailTextFeield.placeholder = "Email".localizedT
        
        phoneTextFeield.placeholder = "Phone".localizedT
        
        passwordTextFeield.placeholder = "Password".localizedT
        
        confirmPasswordTextFeield.placeholder = "ConfirmPassword".localizedT
        
        createButton.localizedTitle = "Create".localizedB
        
        loginHereButton.localizedTitle = "LoginHere".localizedB
     
        alreadyHaveAnAccont.text = "AlreadyHaveAnAccont".localizedT
        
        
        
       
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

    @IBAction func emaulV(_ sender: Any){
        let text = emailTextFeield.text ?? ""
        if Utilities.validateEmailId(emailID: text) {
            emailError.text = ""
            emailError.textColor = UIColor.black
        }else{
            emailError.text = "Emailnotvaled".localizedT
            emailError.textColor = UIColor.red
        }
    }
//    @IBAction func phoneV(_ sender: Any){
//        let text = phoneTextFeield.text ?? ""
//        if Utilities.validaPhoneNumber(phoneNumber: text){
//            phoneError.text = ""
//            phoneError.textColor = UIColor.black
//        }else{
//            phoneError.text = "phonenot".localizedT
//            emailError.textColor = UIColor.red
//        }
//    }
    @IBAction func pass_act(_ sender: Any){
        let text = passwordTextFeield.text ?? ""
        if Utilities.isPasswordValid(text) {
            passwordError.text = "StrongPassword".localizedT
            passwordError.textColor = UIColor.green
        }else{
            passwordError.text = "Weakpassword".localizedT
            passwordError.textColor = UIColor.red
        }
    }
    @IBAction func comPass_act(_ sender: Any){
        let text = confirmPasswordTextFeield.text ?? ""
        if Utilities.isConfirmPasswordValid(text) {
            confirmPasswordError.text = "StrongPassword".localizedT
            confirmPasswordError.textColor = UIColor.green
        }else{
            confirmPasswordError.text = "Weakpassword".localizedT
            confirmPasswordError.textColor = UIColor.red
        }
        if passwordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) == confirmPasswordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) {
            self.passwordError.text = "PasswordMatch".localizedT
            self.confirmPasswordError.text = "PasswordMatch".localizedT
            self.passwordError.textColor = UIColor.green
            self.confirmPasswordError.textColor = UIColor.green
        }else{
            //self.passwordError.text = "PasswordDon'tMatch".localizedT
            self.confirmPasswordError.text = "PasswordDon'tMatch".localizedT
            //self.passwordError.textColor = UIColor.red
            self.confirmPasswordError.textColor = UIColor.red
                }
    }
   
    
    
    func validateFields() -> String? {
        
       
        if firstNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.firstNameError.text = "firstNameError".localizedT
            //"First Name is Emtey"
        }
        
        if lastNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.lastNameError.text = "lastNameError".localizedT
            //"Last Name is Emtey"
        }
        
       
        if emailTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) == ""  {
            self.emailError.text = "emailError".localizedT
            //"E-mail is Emtey"
        }
        
        
        if phoneTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.phoneError.text =
                "phoneError".localizedT
            //"Phone is not valed"
        }
        
       
        if passwordTextFeield.text! ==  "" {
            self.passwordError.text =
                "passwordError".localizedT
            //"Password is Emtey"
        }
        if confirmPasswordTextFeield.text! == "" {
            self.confirmPasswordError.text = "confirmPasswordError".localizedT
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
            
            let password = passwordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            //Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
            Auth.auth().createUser(withEmail: email, password: password) { authResult, err in
              
              
            
                
                if err != nil {

                    self.showErrorAlertCreate("")
                    

                }
                else{
                    
                    let db = Firestore.firestore()
//
//                    var ref : DocumentReference? = nil
//                    ref = db.collection("users").addDocument(data: ["FirstName":firstName,
//                                                                    "LastName" :lastName,
//                                                                    "phone":phoneNumber]) { error in
//                        if error != nil {
                                                             
//                    db.collection("users").addDocument(data: ["FirstName":firstName,"LastName" :lastName,"phone":phoneNumber, "uid": authResult!.user.uid]) { (error) in
                    db.collection("users").addDocument(data: ["FirstName":firstName,"LastName" :lastName,"phone":phoneNumber, "uid": authResult!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showErrorAlertDB("")
                        }else {
                            
                            //transitionToHome
                            let loginViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController
                            
                            self.view.window?.rootViewController = loginViewController
                            self.view.window?.makeKeyAndVisible()
                            
                            self.cleenTextFeield()
                        }
                        
                    }
                }
                
          }

        }
        //cleenTextFeield()
   }
    func showErrorAlertCreate(_ message:String) {
        let alert = UIAlertController(title: "Error"
                                      , message: "Error creating user",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }
    func showErrorAlertDB(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Error db", preferredStyle: .alert)
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
    
    func cleenTextFeield (){
        firstNameTextFeield.text = ""
        lastNameTextFeield.text = ""
        phoneTextFeield.text = ""
        emailTextFeield.text = ""
        passwordTextFeield.text = ""
        passwordTextFeield.text = ""
        passwordError.text = ""
        confirmPasswordError.text = ""
    }
    
    @IBAction func signupHereButton(_ sender: UIButton) {
        
        let loginViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.loginViewController) as? LoginViewController

        self.view.window?.rootViewController = loginViewController
        self.view.window?.makeKeyAndVisible()
    }
}










//        let Password = passwordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//               if Utilities.isPasswordValid(Password) == false {
//                   self.passwordError.text = ("8 characters long at least 1 uppercase, 1 lowercase, 1 Number and 1 special characters")
//               }
//               let ConfirmPassword = confirmPasswordTextFeield.text ?? ""
//               if Utilities.isConfirmPasswordValid(ConfirmPassword) == false {
//                   self.confirmPasswordError.text = ("8 characters long at least 1 uppercase, 1 lowercase, 1 Number and 1 special characters")
//               }

//        if passwordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) != confirmPasswordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines) {
//            self.confirmPasswordError.text = ("Passwor don't match")
//        }

//Text field not emty
//        let FirstName = firstNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.validateNameF(FirstName) == false {
//            self.firstNameError.text = "First Name is Emtey"
//        }
//
//        let LastName = lastNameTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.validateNameL(LastName) == false {
//            self.lastNameError.text = "Last Name is Emtey"
//        }
//
//        let Email = emailTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.validateEmailId(emailID: Email) == false {
//            self.emailError.text = "E-mail is Emtey"
//        }
//
//        let Phone = phoneTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.validaPhoneNumber(phoneNumber: Phone) == false {
//            self.phoneError.text = "Phone is not valed"
//        }

//password req

//        let Password = passwordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.isPasswordValid(Password) == false {
//            self.passwordError.text = ("8 characters long at least 1 uppercase, 1 lowercase, 1 Number and 1 special characters")
//        }
//        let ConfirmPassword = confirmPasswordTextFeield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        if Utilities.isConfirmPasswordValid(ConfirmPassword) == false {
//            self.confirmPasswordError.text = ("8 characters long at least 1 uppercase, 1 lowercase, 1 Number and 1 special characters")
//        }
//
//        if passwordTextFeield != confirmPasswordTextFeield {
//            self.PasswordValidAlert("")
//        }
