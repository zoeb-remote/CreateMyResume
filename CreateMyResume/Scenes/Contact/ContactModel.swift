//
//  ContactModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ContactContentModel: Codable {
    var mobile: String
    var email: String
    var address: String
    
    init() {
        self.mobile = ""
        self.email = ""
        self.address = ""
    }
}
