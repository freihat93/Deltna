

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class LoginViewController: UIViewController {

    @IBOutlet weak var emailError: UILabel!
    @IBOutlet weak var passwordError: UILabel!
    @IBOutlet weak var emailTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var loginButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()


        setUpElements()




    }


    func setUpElements() {


        Utilities.styleTextField(emailTextField)

        Utilities.styleTextField(passwordTextField)

        Utilities.styleFilledButton(loginButton)
    }
    func validateFields() -> String? {

        //Text field not emty



        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            emailError.text = "Please e"
        }else{
            emailError.text = ""
        }
        if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{            passwordError.text = "Please ph"
        }else{
            passwordError.text = ""
        }





        return nil
    }
    @IBAction func loginButton(_ sender: Any) {


        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)

        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in

            if self.validateFields() != nil {
                self.validateFields()

            }else
            {

            if error != nil {

//                self.emailError.text = error!.localizedDescription
//                self.emailError.alpha = 1
//
//
//                self.passwordError.text = error!.localizedDescription
//                self.passwordError.alpha = 1


                self.LoginErrorAlert("")
               // self.emailTextField.text = ""
               // self.passwordTextField.text = ""

            }
            else{

                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController

                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()

                self.emailTextField.text = ""
                self.passwordTextField.text = ""

            }
        }
        }}

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




}



//import UIKit
//import FirebaseAuth
//import Firebase
//import FirebaseFirestore
//
//class LoginViewController: UIViewController {
//
//    @IBOutlet weak var emailError: UILabel!
//    @IBOutlet weak var passwordError: UILabel!
//    @IBOutlet weak var emailTextField: UITextField!
//
//    @IBOutlet weak var passwordTextField: UITextField!
//
//    @IBOutlet weak var loginButton: UIButton!
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        setUpElements()
//
//
//
//
//    }
//
//
//    func setUpElements() {
//
//
//        Utilities.styleTextField(emailTextField)
//
//        Utilities.styleTextField(passwordTextField)
//
//        Utilities.styleFilledButton(loginButton)
//    }
//    func validateFields() {
//
//        //Text field not emty
//
//
//
//        if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
//            emailError.text = "Please e"
//        }else{
//            emailError.text = ""
//        }
//        if passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{            passwordError.text = "Please ph"
//        }else{
//            passwordError.text = ""
//        }
//
//    }
//    @IBAction func loginButton(_ sender: Any) {
//
//
//        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
//
//        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
//
//
//
//
//            if error != nil {
//
//                self.passwordError.text = error!.localizedDescription
//                self.passwordError.alpha = 1
//
//            }
//            else{
//
//                let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
//
//                self.view.window?.rootViewController = homeViewController
//                self.view.window?.makeKeyAndVisible()
//
//
//
//            }
//        }
//        }
//
//    func LoginErrorAlert(_ message:String) {
//        let alert = UIAlertController(title: "Error", message: "Email or Password is incorrect", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel ))
//        present(alert, animated: true)
//    }
//
//    func showError(_ message: String){
//
//        emailError.text = message
//        emailError.alpha = 1
//
//
//        passwordError.text = message
//        passwordError.alpha = 1
//
//}
//
//
//
//
//}
