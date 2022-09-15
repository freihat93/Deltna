//
//  PaymentNoticeViewController.swift
//  Deltna
//
//  Created by Mohammad on 9/6/22.
//

import UIKit

class PaymentNoticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func xbutton(_ sender: UIButton) {
        dismiss(animated: true) {
            self.removeFromParent()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
