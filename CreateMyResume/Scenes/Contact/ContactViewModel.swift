//
//  ContactViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

struct ContactInputModel {
    let contentModel: ContactContentModel
}

class ContactViewModel {
    var contentModel: ContactContentModel
    
    init(contentModel: ContactContentModel) {
        self.contentModel = contentModel
    }
}
