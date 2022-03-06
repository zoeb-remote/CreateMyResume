//
//  AddProjectModel.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import Foundation

class AddProjectModel: Codable {
    var projectName: String
    var teamSize: Int
    var summary: String
    var technologyUsed: String
    var role: String
    
    init() {
        self.projectName = ""
        self.teamSize = 0
        self.summary = ""
        self.technologyUsed = ""
        self.role = ""
    }
}
