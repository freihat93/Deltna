//
//  UIView+Extension.swift
//  Deltna
//
//  Created by Mohammad on 9/6/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat{
        get { return cornerRadius}
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
