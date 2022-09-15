////
////  EditSubscribtion.swift
////  Deltna
////
////  Created by Mohammad on 8/29/22.
////
//
import Foundation
import FirebaseFirestore

class EditSubscribtion {
    
    @Published var Compane:  String = ""
    @Published var address:  String = ""
    @Published var building:  String = ""
    @Published var subscribtionDays:  String = ""
    @Published var Arabic: String = ""
    @Published var saudi:  String = ""
    
   

    func fetch() {
        let db = Firestore.firestore()

        let docRef = db.collection("sub").document()

        docRef.getDocument { [self] (document, error) in
            guard error == nil else {
                print("error", error ?? "")
                return
            }

            if let document = document, document.exists {
                let data = document.data()
                if let data = data {
                    print("data", data)
                    self.Compane = data[Compane] as? String ?? ""
                    self.address = data[address] as? String ?? ""
                    self.building = data[building] as? String ?? ""
                    self.subscribtionDays = data[subscribtionDays] as? String ?? ""
                    self.Arabic = data[Arabic] as? String ?? ""
                    self.saudi = data[saudi] as? String ?? ""
                }
            }

        }
    }
    init() {
        fetch()
    }
    
    func fetchAllRestaurants() {
            let db = Firestore.firestore()

            db.collection("sub").getDocuments() { (querySnapshot, error) in
                            if let error = error {
                                    print("Error getting documents: \(error)")
                            } else {
                                    for document in querySnapshot!.documents {
                                            print("\(document.documentID): \(document.data())")
                                    }
                            }
            }
    }
    init() {
        fetchAllRestaurants()
    }
}

