//
//  WorkModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class WorkContentModel: Codable {
    var totalExperience: String
    var workSummary: String
    var companyName: String
    var duration: String
    
    init() {
        self.totalExperience = ""
        self.workSummary = ""
        self.companyName = ""
        self.duration = ""
    }
    
}
