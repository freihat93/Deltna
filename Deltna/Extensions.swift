////
////  Extensions.swift
////  Deltna
////
////  Created by Mohammad on 8/20/22.
////
//
//import UIKit
//
//extension UIView{
//
//func anchorToTop(_ top:NSLayoutXAxisAnchor? = nil, left :
//                    NSLayoutXAxisAnchor? = nil, bottom: NSLayoutXAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil){
//    
//    anchorWithConstantsToTop(top, left:left, bottom:bottom, right:right,
//                             topConstant: 0, leftConstant:0, bottomConstant:0,
//                             rightConstant:0)
//}
//
//func anchorWithConstantsToTop(_ top: NSLayoutXAxisAnchor? = nil, left:NSLayoutXAxisAnchor? = nil, bottom:NSLayoutXAxisAnchor? = nil,right:NSLayoutXAxisAnchor? = nil,topConstant: CGFloat = 0,leftConstant: CGFloat = 0,bottomConstant: CGFloat = 0,rightConstant: CGFloat = 0){
//    
//     translatesAutoresizingMaskIntoConstraints = false
//    
//    if let top = top{
//        topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
//    }
//    if let bottom = bottom{
//        bottomAnchor.constraint(equalTo: bottom, constant:  bottomConstant).isActive = true
//    }
//    if let left = left{
//        leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
//    }
//    if let right = right{
//        rightAnchor.constraint(equalTo: right, constant:  rightConstant).isActive = true
//    }
//}
//
//}
