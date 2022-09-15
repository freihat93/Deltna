//
//  yourSubscribtionViewController.swift
//  Deltna
//
//  Created by Mohammad on 9/1/22.
//

import UIKit
import Firebase



class YourSubscribtionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet var tableView: UITableView!
    
    
    @Published var mySub = [Subscribtion]()
    var selected : (([String?]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.frame = tableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        self.tableView.delegate = self
        tableView.dataSource = self
        
        
        
        
        let db = Firestore.firestore()
        let userID = UUID.uid
        var Subscribtions = [Subscribtion]()
        
        
        let userSubs = db.collection("userSub").document(userID!)
        userSubs.getDocument { (document, error) in
            if let document = document, document.exists {
                let userSub = document.get("userSub") as! [String]
                for sub in userSub {
                    
                    
                    db.collection("sub").whereField("SubID", isEqualTo: sub)
                        .getDocuments(){ [weak self](querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                            } else {
                                Subscribtions = querySnapshot!.documents.map { d in
                                    
                                    Subscribtion(id: d.documentID, Company: d["Compane"] as? String ?? "")
                                    
                                }
                                self?.mySub.append(contentsOf: Subscribtions)
                                print(Subscribtions)
                                print(self?.mySub.count)
                                self?.tableView.reloadData()
                                
                            }
                            
                        }
                }} else {
                    print("Document does not exist")
                }
        }
        
        
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return MySub.count
        return mySub.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //        Cell.textLabel?.text = MySub[indexPath.row]
        Cell.textLabel?.text = mySub[indexPath.row].Company
        print(Cell)
        
        return Cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let editSubscribtionViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.editSubscribtionViewController) as!
            EditSubscribtionViewController
        
        //        let Items = mySub[indexPath.section]
        //        let editSubscribtionViewController = EditSubscribtionViewController(selectItem: Items.Company, relatedItem: [Items.id])
        
        self.navigationController?.pushViewController(editSubscribtionViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
        
        
        
        
        
        
        
        var index = self.tableView.indexPathForSelectedRow
        
        print(indexPath)
        print(index)
        
    }
    
    
    
    
    
    @IBAction func GoButton(_ sender: UIButton) {
    }
    
    //    func getData() {
    ////        var docRef: DocumentReference!
    //        let db = Firestore.firestore()
    //
    //                db.collection("sub").getDocuments() { snapshot, error in
    //                                if  error == nil {
    //                                    if let snapshot = snapshot {
    //
    //                                        self.mySub = snapshot.documents.map { d in
    //  return Subscribtion(id: d.documentID, Compane: d["Compane"] as? String ?? "")
    //                                        }
    //                                    }
    //                                }
    //
    
    
    
    
    
    
    
    
    
    //                                        print("Error getting documents: \(error)")
    //                                } else {
    //
    //                                        for document in querySnapshot!.documents {
    //                                            print("\(document.documentID): \(document.data())")
    //                                            let myData = document.data()
    //
    //                                            let latsetcom = querySnapshot.myData["Compane"] as? String ?? ""
    //
    //
    //                                            self.mySub.append() = latsetcom
    //                                            self.mySub.append = latsetcom
    //
    //
    //                                        }
    //                                }
    //                }
    //
    
    //    }
    
    //}
}
