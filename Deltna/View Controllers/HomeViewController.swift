//
//  HomeViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/22/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var subscriptinButton: UIControl!
   
    
    
    
    @IBOutlet weak var orderButton: UIControl!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    
    func setUpElements() {


        Utilities.styleView(subscriptinButton)
        Utilities.styleView(orderButton)


    }
    
   
    
    
    
    @IBAction func onClickSubscriptionButton(_ sender: Any) {
        
//        let subscribtionViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.subscribtionViewController) as? SubscribtionViewController
//
//        self.view.window?.rootViewController = subscribtionViewController
//        self.view.window?.makeKeyAndVisible()
        
        let subscribtionViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.subscribtionViewController) as!
            SubscribtionViewController

        self.navigationController?.pushViewController(subscribtionViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @IBAction func onClickOrderButton(_ sender: Any) {
        
//        let orderViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.orderViewController) as? OrderViewController
//
//        self.view.window?.rootViewController = orderViewController
//        self.view.window?.makeKeyAndVisible()
        
        let orderViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.orderViewController) as!
            OrderViewController

        self.navigationController?.pushViewController(orderViewController, animated: true)
        self.tabBarController?.tabBar.isHidden = true
    }
    

}
