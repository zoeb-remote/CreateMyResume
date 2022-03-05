//
//  AboutViewModel.swift
//  CreateMyResume
//
//  Created by Bigsur on 05/03/22.
//

import Foundation
import UIKit

struct AboutInputModel {
    let contentModel: AboutContentModel
}

class AboutViewModel {
    var contentModel: AboutContentModel
    var userImage: UIImage? {
        let imageName = self.contentModel.picture
        if imageName.isEmpty == false {
            return ImageStore.retrieve(imageNamed: imageName)
        } else {
            return UIImage(named: "profile_placeholder")
        }
    }
    
    init(contentModel: AboutContentModel) {
        self.contentModel = contentModel
    }
}
