//
//  AboutModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class AboutContentModel: Codable {
    var firstName: String
    var lastName: String
    var picture: String
    
    init() {
        self.firstName = ""
        self.lastName = ""
        self.picture = ""
    }
}
