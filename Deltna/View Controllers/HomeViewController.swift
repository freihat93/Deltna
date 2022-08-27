//
//  HomeViewController.swift
//  Deltna
//
//  Created by Mohammad on 8/22/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var subscriptinButton: UIControl!{
        didSet{
            subscriptinButton .layer.cornerRadius = 5
        }
    }
    
    @IBOutlet weak var orderButton: UIView!{
        didSet{
            orderButton.layer.cornerRadius = 5
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSubscriptionButton(_ sender: Any) {
        
        let subscribtionViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.subscribtionViewController) as? SubscribtionViewController

        self.view.window?.rootViewController = subscribtionViewController
        self.view.window?.makeKeyAndVisible()
    }
    
    @IBAction func onClickOrderButton(_ sender: Any) {
        
        let orderViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.orderViewController) as? OrderViewController

        self.view.window?.rootViewController = orderViewController
        self.view.window?.makeKeyAndVisible()
    }
    

}
