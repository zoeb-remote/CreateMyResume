//
//  WorkModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class WorkContentModel: Codable {
    var totalExperience: String
    var workModels: [AddWorkModel]
    
    init() {
        self.totalExperience = ""
        self.workModels = [AddWorkModel]()
    }
    
}
