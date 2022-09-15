//
//  EditSubscribtionViewController.swift
//  Deltna
//SubscribtionViewController.swift
//docRef
//
//  Created by Mohammad on 8/29/22.
//

import UIKit
import Firebase

class EditSubscribtionViewController: UIViewController   {
 
    @IBOutlet weak var editTitleLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var copaneName: UITextField!
    @IBOutlet weak var addrss: UITextField!
    @IBOutlet weak var bulding: UITextField!
    
    @IBOutlet weak var comError: UILabel!
    
    @IBOutlet weak var buldingError: UILabel!
    @IBOutlet weak var addrssError: UILabel!
   
    @IBOutlet weak var countError: UILabel!
    
    @IBOutlet weak var pinLocation: UIButton!
    @IBOutlet weak var capLabel: UILabel!
    @IBOutlet weak var subDaysLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var sauidLabel: UILabel!
    @IBOutlet weak var submetButton: UIButton!
    
    @IBOutlet weak var countArabicCoffee: UILabel!
    @IBOutlet weak var countSauidiCoffee: UILabel!
    
    @IBOutlet weak var cupSegment: UISegmentedControl!
    
    @IBOutlet weak var daysSegment: UISegmentedControl!
    
    var capValue: String?
    var daysValue: String?
    
    var daysIndex: Int?
    var cupIndex: Int?
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
       // getData()
        
        setUpElements()
        
    }
    
    private let selectItem: String
    private let relatedItem: [String]
    init(selectItem: String, relatedItem: [String]){
        self.selectItem = selectItem
        self.relatedItem = relatedItem
        super.init(nibName: nil, bundle: nil)
        print(selectItem)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpElements() {


        Utilities.styleFilledButtonLouction(pinLocation)

        Utilities.styleFilledButton(submetButton)
    }
    
    
    @IBAction func arabicCoffeeStepper(_ sender: UIStepper) {
        
        countArabicCoffee.text = Int(sender.value).description
    }
    
    @IBAction func saudiCoffeeStepper(_ sender: UIStepper) {
        countSauidiCoffee.text = Int(sender.value).description
        
    }
    
    func getData() {
        
        
        let db = Firestore.firestore()
        

        db.collection("sub").whereField("SubID", isEqualTo: selectItem ).getDocuments() { (querySnapshot, error) in
                                if let error = error {
                                        print("Error getting documents: \(error)")
                                } else {
                                        for document in querySnapshot!.documents {
                                            print("\(document.documentID): \(document.data())")
                                            let myData = document.data()
                                           
                                            let id = myData["SubID"] as? String ?? ""
                                            let latsetcom = myData["Compane"] as? String ?? ""
                                            let latsetadd = myData["address"] as? String ?? ""
                                            let latsetbul = myData["building"] as? String ?? ""
                                            let latsetdays = myData["subscribtionDays"] as? String ?? ""
                                            let latsetpayment = myData["paymentMethods"] as? String ?? ""
                                            let latsetcup = myData["cup"] as? String ?? ""
                                            let latsetara = myData["Arabic"] as? String ?? ""
                                            let latsetsau = myData["saudi"] as? String ?? ""
                                          
                                            
                                            self.copaneName.text = latsetcom
                                            self.addrss.text = latsetadd
                                            self.bulding.text = latsetbul
                                            self.countArabicCoffee.text = latsetara
                                            self.countSauidiCoffee.text = latsetsau
                                            
                                            
                                            if latsetdays == "5 Days"{
                                                return self.daysIndex = 0
                                            }else if latsetdays == "6 Days"{
                                                return self.daysIndex = 1
                                            }
                                            
                                            
                                            if latsetcup == "Cardboard Cups"{
                                                return self.cupIndex = 0
                                            }else if latsetcup == "Plastic Cups"{
                                                return self.cupIndex = 1
                                            }
                                        }
                                }
                }
   
    
    }
    
    
    
    
    @IBAction func cupSegment(_ sender: UISegmentedControl) {
       
        //cupSegment.selectedSegmentIndex = 1;
        capValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
        
    }
    @IBAction func daySegment(_ sender: UISegmentedControl) {
        //daysSegment.selectedSegmentIndex = 1;
        daysValue = sender.titleForSegment(at: sender.selectedSegmentIndex)
        
    }
    @IBAction func EditButton(_ sender: UIButton) {
        
    }
    
    @IBAction func SubmitChangeButton(_ sender: UIButton) {
        
        let compane = copaneName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
        let address = addrss.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let building = bulding.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let cup = capValue
        let days = daysValue
        let arabic = countArabicCoffee.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let saudi = countSauidiCoffee.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("sub").document()

        // Set the "capital" field of the city 'DC'
        docRef.updateData([
            "Compane": compane,
            "address": address,
            "building": building,
            "cup": cup ?? "Cardboard Cups",
            "subscribtionDays": days ?? "5 Days",
            "Arabic": arabic,
            "saudi": saudi
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    
    
}

