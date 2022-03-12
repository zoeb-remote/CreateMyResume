//
//  AlertViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 12/03/22.
//

import UIKit

class AlertViewController {
    
    static let sharedInstance = AlertViewController()
    static let kDefaultMessage = "Required field shoud not be empty"
    static let kDefaultTitle = "Warning"
    
    //This is alert function
    func alertWindow(title: String = kDefaultTitle, message: String = kDefaultMessage, onVC viewController: UIViewController? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            })
            alertController.addAction(defaultAction)
            if let viewController = viewController {
                viewController.present(alertController, animated: true, completion: nil)
            } else {
                let alertWindow = UIApplication.shared.windows.first
                alertWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
