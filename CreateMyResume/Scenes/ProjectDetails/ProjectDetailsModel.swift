//
//  ProjectDetailsModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ProjectDetailsContentModel: Codable {
    var projectsModels: [AddProjectModel]
    
    init() {
        self.projectsModels = [AddProjectModel]()
    }
    
}
