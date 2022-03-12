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
    @IBInspectable var regex: String?
}

@IBDesignable public class ValidatorTextView: UITextView {
    @IBInspectable var regex: String?
}

@IBDesignable public class BaseViewController: UIViewController {
    @IBInspectable var validatorTextFields: [ValidatorTextField]?
    @IBInspectable var validatorTextViews: [ValidatorTextView]?
    
    var isFormValid: Bool {
        if let validatorTextFields = validatorTextFields {
            for validator in validatorTextFields {
                switch validator.regex {
                case ValidatorType.email.rawValue:
                    debugPrint(validator.regex ?? "EMPTY")
                case ValidatorType.phone.rawValue:
                    debugPrint(validator.regex ?? "EMPTY")
                case ValidatorType.nonEmpty.rawValue:
                    debugPrint(validator.regex ?? "EMPTY")
                default:
                    debugPrint(validator.regex ?? "EMPTY")
                }
            }
        }
        
        return true
    }
}


