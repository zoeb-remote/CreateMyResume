//
//  UIViewControllerExtension.swift
//  CreateMyResume
//
//  Created by Bigsur on 05/03/22.
//

import UIKit

extension UIViewController {
    
    func setupConstraintForChildViewController(childVC:UIViewController, containerView:UIView) {
        
        self.addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.didMove(toParent: self)
        
        let horzConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|", options: [], metrics: nil, views: ["childView": childVC.view as Any])
        let vertConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|", options: [], metrics: nil, views: ["childView": childVC.view as Any])
        
        containerView.addConstraints(horzConstraints)
        containerView.addConstraints(vertConstraints)
        
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    static var className: String {
        return "\(self)"
    }
}
