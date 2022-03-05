//
//  UIViewExtension.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        return Bundle.main.loadNibNamed(nibName, owner: self, options: nil)?.first as! UIView
    }
}
