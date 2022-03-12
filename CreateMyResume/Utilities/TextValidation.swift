//
//  TextValidation.swift
//  CreateMyResume
//
//  Created by Zoeb on 12/03/22.
//

import UIKit

public enum ValidatorType: String {
    case none
    case email
    case phone
    case nonEmpty
}

@IBDesignable public class ValidatorTextField: UITextField {
    @IBInspectable var regex: String = ValidatorType.none.rawValue
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: self.text)
    }
    
    var isValidPhone: Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: self.text)
    }
}

@IBDesignable public class ValidatorTextView: UITextView {
    @IBInspectable var regex: String = ValidatorType.none.rawValue
}

@IBDesignable public class BaseViewController: UIViewController {
    @IBOutlet var validatorTextFields: [ValidatorTextField]?
    @IBOutlet var validatorTextViews: [ValidatorTextView]?
    
    private enum Constants {
        static let invalidEmailMessage = "Email should be valid"
        static let invalidPhoneMessage = "Phone should be valid"
    }
    
    var isFormValid: Bool {
        if let validatorTextFields = validatorTextFields {
            for validatorField in validatorTextFields {
                if let validatorFieldText = validatorField.text {
                    switch validatorField.regex {
                    case ValidatorType.email.rawValue:
                        if validatorFieldText.isEmpty || !validatorField.isValidEmail {
                            showAlert(message: Constants.invalidEmailMessage)
                            validatorField.becomeFirstResponder()
                            return false
                        }
                    case ValidatorType.phone.rawValue:
                        if validatorFieldText.isEmpty || !validatorField.isValidPhone {
                            showAlert(message: Constants.invalidPhoneMessage)
                            validatorField.becomeFirstResponder()
                            return false
                        }
                    case ValidatorType.nonEmpty.rawValue:
                        if validatorFieldText.isEmpty {
                            showAlert()
                            validatorField.becomeFirstResponder()
                            return false
                        }
                    default:
                        debugPrint(validatorField.regex)
                    }
                }
            }
        }
        
        if let validatorTextViews = validatorTextViews {
            for validatorField in validatorTextViews {
                switch validatorField.regex {
                case ValidatorType.nonEmpty.rawValue:
                    if validatorField.text.isEmpty {
                        showAlert()
                        validatorField.becomeFirstResponder()
                        return false
                    }
                default:
                    debugPrint(validatorField.regex)
                }
            }
        }
        
        return true
    }
}


