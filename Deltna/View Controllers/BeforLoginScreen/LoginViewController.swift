

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController {

    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var orSingLabel: UILabel!
    
    @IBOutlet weak var singupButton: UIButton!
    @IBOutlet weak var dontLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()


        setUpElements()

        welcomLabel.text = "WelcomeBack".localizedT
        
        emailTextField.placeholder = "Email".localizedT
        
        passwordTextField.placeholder = "Password".localizedT
        
        forgetPasswordButton.localizedTitle = "ForgetPassword".localizedB
        
        loginButton.localizedTitle = "LogIn".localizedB
        
        orSingLabel.text = "OrSignInWith".localizedT
        
        dontLabel.text = "Don'tHaveAccont?".localizedT
        
        singupButton.localizedTitle = "SingUp".localizedB


    }


    func setUpElements() {


        Utilities.styleTextField(emailTextField)

        Utilities.styleTextField(passwordTextField)

        Utilities.styleFilledButton(loginButton)
    }
    func validateFields() {

        //Text field not emty


        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            emailError.text = "emailError".localizedT
        }else{
            emailError.text = ""
        }
        if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            passwordError.text = "passwordError".localizedT
        }else{
            passwordError.text = ""
        }

    }
    @IBAction func loginButton(_ sender: Any) {


        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in




            if error != nil {

                self.passwordError.text = error!.localizedDescription
                self.passwordError.alpha = 1

            }
            else{

                let tabBarViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.tabBarViewController) as?
                    HomeViewController
                
                self.view.window?.rootViewController = tabBarViewController
                self.view.window?.makeKeyAndVisible()



            }
        }
        }

    func LoginErrorAlert(_ message:String) {
        let alert = UIAlertController(title: "Error", message: "Email or Password is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
        present(alert, animated: true)
    }

    func showError(_ message: String){

        emailError.text = message
        emailError.alpha = 1


        passwordError.text = message
        passwordError.alpha = 1

}

    @IBAction func signupButton(_ sender: UIButton) {
        
        let signupViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.signupViewController) as? SingupViewController
        
        view.window?.rootViewController = signupViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func forgetPasswordButton(_ sender: UIButton) {
        
        let restPasswordViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.restPasswordViewController) as? RestPasswordViewController
        
        view.window?.rootViewController = restPasswordViewController
        view.window?.makeKeyAndVisible()
    }
    

}
