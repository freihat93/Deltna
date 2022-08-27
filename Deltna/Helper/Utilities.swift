//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleFilledButtonLouction(_ button:UIButton) {
        
        // Filled rounded corner style
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.blue
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func isPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    static func isConfirmPasswordValid(_ password : String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    static func validateNameF(_ nameF: String) -> Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "^{3,18}$"
          let trimmedString = nameF.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
       }
    static func validateNameL(_ nameL: String) ->Bool {
          // Length be 18 characters max and 3 characters minimum, you can always modify.
          let nameRegex = "^{3,18}$"
          let trimmedString = nameL.trimmingCharacters(in: .whitespaces)
          let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
          let isValidateName = validateName.evaluate(with: trimmedString)
        return isValidateName
       }
    static func validaPhoneNumber(phoneNumber: String) -> Bool {
          let phoneNumberRegex = "^((\\[0-9]{10,}$"
          let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
          let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
          let isValidPhone = validatePhone.evaluate(with: trimmedString)
          return isValidPhone
       }
    static func validateEmailId(emailID: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+[A-Za-z]{2,64}"
          let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
          let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
          let isValidateEmail = validateEmail.evaluate(with: trimmedString)
          return isValidateEmail
       }
    static func validatePassword(password: String) -> Bool {
          //Minimum 8 characters at least 1 Alphabet and 1 Number:
          let passRegEx = "^(?=.*[A-Za-z])(?=.*)[A-Za-z]{8,}$"
          let trimmedString = password.trimmingCharacters(in: .whitespaces)
          let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassord.evaluate(with: trimmedString)
          return isvalidatePass
       }
    static func validateAnyOtherTextField(otherField: String) -> Bool {
          let otherRegexString = "Your regex String"
          let trimmedString = otherField.trimmingCharacters(in: .whitespaces)
          let validateOtherString = NSPredicate(format: "SELF MATCHES %@", otherRegexString)
          let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
          return isValidateOtherString
       }
}
