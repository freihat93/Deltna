//
//  SubscribtionViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/20/22.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore



class SubscribtionViewController: UIViewController  {
    
    @IBOutlet weak var CompaneError: UILabel!
    
    @IBOutlet weak var addressError: UILabel!
    
    @IBOutlet weak var BuildingError: UILabel!
    
    @IBOutlet weak var CountError: UILabel!
    
    
    
    @IBOutlet weak var companeNameTextField: UITextField!
    
    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var buildingTextField: UITextField!
    @IBOutlet weak var pinLocutionButton: UIButton!
    
    @IBOutlet weak var cupSegment: UISegmentedControl!
    @IBOutlet weak var CountArabicCoffee: UILabel!
    @IBOutlet weak var CountSaudiCoffee: UILabel!
    
    @IBOutlet weak var paymentSegment: UISegmentedControl!
    @IBOutlet weak var daysSegment: UISegmentedControl!
    @IBOutlet weak var buybutton: UIButton!
    
    var capValue: String?
    var daysValue: String?
    var panymentValue: String?
    @Published var docRef: DocumentReference!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
        cupSegment.setTitle("Cardboard Cups", forSegmentAt: 0)
        cupSegment.setTitle("Plastic Cups", forSegmentAt: 1)
        daysSegment.setTitle("5 Days", forSegmentAt: 0)
        daysSegment.setTitle("6 Days", forSegmentAt: 1)
        paymentSegment.setTitle("Weekly", forSegmentAt: 0)
        paymentSegment.setTitle("Monthly", forSegmentAt: 1)
        
        
        
        
    }
    
    
    func setUpElements() {
        
        
        Utilities.styleTextField(companeNameTextField)
        Utilities.styleTextField(addressTextField)
        Utilities.styleTextField(buildingTextField)
        Utilities.styleFilledButtonLouction(pinLocutionButton)
        Utilities.styleFilledButton(buybutton)
    }
    
    @IBAction func arabicCoffeeStepper(_ sender: UIStepper) {
        
        CountArabicCoffee.text = Int(sender.value).description
    }
    
    @IBAction func saudiCoffeeStepper(_ sender: UIStepper) {
        CountSaudiCoffee.text = Int(sender.value).description
        
    }
    @IBAction func cupSegment(_ sender: UISegmentedControl) {
        capValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    @IBAction func daySegment(_ sender: UISegmentedControl) {
        daysValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    
    @IBAction func paymentSegment(_ sender: UISegmentedControl) {
        panymentValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
    }
    
    
    
    func validateFields() -> String? {
        if companeNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.CompaneError.text = "compError".localizedT
            //"First Name is Emtey"
        }
        if addressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.addressError.text = "addressError".localizedT
            //"First Name is Emtey"
        }
        if buildingTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            self.BuildingError.text = "buildingError".localizedT
            //"First Name is Emtey"
        }
        if CountArabicCoffee.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "0" &&
            CountSaudiCoffee.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "0"{
            self.CountError.text = "CountError".localizedT
            //"First Name is Emtey"
        }
        return nil
    }
    
    
    @IBAction func buyButton(_ sender: UIButton) {
        
        let error = validateFields()
        
        
        if error != nil {
            
            showError(error!)
            
        }
        else{
            let company = companeNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let address = addressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let building = buildingTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let cup = capValue
            let days = daysValue
            let payment = panymentValue
            let arabic = CountArabicCoffee.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let saudi = CountSaudiCoffee.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            let db = Firestore.firestore()
            
            let SubID = Utilities.MyRecord().uid
            
            var docRefSub: DocumentReference!
            
            docRefSub = db.collection("sub").addDocument(data: [
                                                            "SubID": SubID,
                                                            "Compane": company,
                                                            "address": address,
                                                            "building": building,
                                                            "cup": cup ?? "Cardboard Cups",
                                                            "subscribtionDays": days ?? "5 Days",
                                                            "paymentMethods": payment ?? "Weekly",
                                                            "Arabic": arabic,
                                                            "saudi": saudi,
                                                            "Status": "Created"]){err in
                if  err != nil {
                    print("Error adding document: \(SubID)")
                    
                    
                    
                    
                } else {
                    
                    let uuid = UUID.uid
                    
                    print("Document added with ID: \(SubID)")
                    let docRefUserSub = db.collection("userSub").document(uuid!)
                    docRefUserSub.getDocument() { (document, err) in
                        
                        if let document = document, document.exists {
                            let userSub = db.collection("userSub").document(uuid!)
                            userSub.updateData(["userSub": FieldValue.arrayUnion(["\(SubID)"])])
                            
                            
                            
                            print("union")
                        }else{
                            let userSub = db.collection("userSub").document(uuid!)
                            userSub.setData(["userSub": [SubID]]) { err in
                                
                                
                                
                                if err != nil{
                                    print("no")
                                }else{
                                    print("add new array")
                                }
                                
                                
                                
                                
                            }
                            
                            
                        }
                    }
                    
                    
                }
            }
            
        }
    }
    
    func showError(_ message: String){
        CompaneError.text = message
        CompaneError.alpha = 1
        
        addressError.text = message
        addressError.alpha = 1
        
        BuildingError.text = message
        BuildingError.alpha = 1
        
        CountError.text = message
        CountError.alpha = 1
        
        
    }
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
}
