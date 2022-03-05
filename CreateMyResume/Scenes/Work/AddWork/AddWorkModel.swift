//
//  AddWorkModel.swift
//  CreateMyResume
//
//  Created by Bigsur on 05/03/22.
//

import Foundation

class AddWorkModel: Codable {
    var companyName: String
    var duration: String
    var isCurrentCompany: Bool
    
    init() {
        self.companyName = ""
        self.duration = ""
        self.isCurrentCompany = false
    }
    
}
