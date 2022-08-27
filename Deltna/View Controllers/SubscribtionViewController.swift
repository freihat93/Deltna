//
//  SubscribtionViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/20/22.
//

import UIKit
import MapKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SubscribtionViewController: UIViewController {
    
    let daysWork = ["5 Days Sunday-to-Thursday","6 Days Saturday-to-Thursday"]
    
  
    

    @IBOutlet weak var companeNameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var buildingTextField: UITextField!
    @IBOutlet weak var pinLocutionButton: UIButton!
    
    @IBOutlet weak var CountArabicCoffee: UILabel!
    @IBOutlet weak var CountSaudiCoffee: UILabel!
    
    @IBOutlet weak var buybutton: UIButton!
    
    @IBOutlet weak var subscribtionPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
        
        subscribtionPicker.delegate = self
        subscribtionPicker.dataSource = self 
        
       
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
    
    @IBAction func buyButton(_ sender: UIButton) {
        let Compane = companeNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let address = addressTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let building = buildingTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
//
        
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "address": "address",
            "Compane": "Compane",
            "building": 34
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
        
    }
    

}
extension SubscribtionViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return daysWork.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return daysWork[row]
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    
    
}
