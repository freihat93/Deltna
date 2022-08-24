//
//  OrderViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/21/22.
//

import UIKit

class OrderViewController: UIViewController {
    
  
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBOutlet weak var buildingTextField: UITextField!
    
    @IBOutlet weak var pinLocutionButton: UIButton!
    
    @IBOutlet weak var buyButton: UIButton!
    
    @IBOutlet weak var dateTF: UITextField!
    
    @IBOutlet weak var CountArabicCoffee: UILabel!
    
    @IBOutlet weak var CountSaudiCoffee: UILabel!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let toolbar = UIToolbar()
//        toolbar.sizeToFit()
//
//
//        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
//        
//        toolbar.setItems([doneBtn], animated: true)
//        
//        dateTF.inputAccessoryView = toolbar
        
//        dateTF.inputView = datePicker
//        
//        datePicker.datePickerMode = .dateAndTime

        setUpElements()
//        createDatePicker()
        
       
//   -     datePicker.datePickerMode = .date
//        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
//  -      datePicker.frame.size = CGSize (width: 0, height: 300)
        
        
       
    }
//
//    func createDatePicker(){
//
//    }
    
    
    @objc func donePressed() {
        
        dateTF.textAlignment = .center
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        //dateTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true )
    }

    func setUpElements() {
    
        
    
        Utilities.styleTextField(addressTextField)
        Utilities.styleTextField(buildingTextField)
        Utilities.styleFilledButtonLouction(pinLocutionButton)
        Utilities.styleFilledButton(buyButton)
    }
    
    @IBAction func arabicCoffeeStepper(_ sender: UIStepper) {
        
        CountArabicCoffee.text = Int(sender.value).description
    }
    
    @IBAction func saudiCoffeeStepper(_ sender: UIStepper) {
        CountSaudiCoffee.text = Int(sender.value).description
        
    }
    
    

}



