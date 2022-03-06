//
//  AboutViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation
import UIKit

struct AboutInputModel {
    let contentModel: AboutContentModel
    let resumeId: String
}

class AboutViewModel {
    var contentModel: AboutContentModel
    let resumeId: String
    var userImage: UIImage? {
        let imageName = self.contentModel.picture
        if imageName.isEmpty == false {
            return ImageStore.retrieve(imageNamed: imageName)
        } else {
            return UIImage(named: "profile_placeholder")
        }
    }
    
    init(contentModel: AboutContentModel, resumeId: String) {
        self.contentModel = contentModel
        self.resumeId = resumeId
    }
}
