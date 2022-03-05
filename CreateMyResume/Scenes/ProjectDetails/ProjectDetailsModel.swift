//
//  ProjectDetailsModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ProjectDetailsContentModel: Codable {
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
