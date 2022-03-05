//
//  EducationModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class EducationContentModel: Codable {
    var classDetails: String
    var year: Int
    var percentage: Double
    
    init() {
        self.classDetails = ""
        self.year = 0
        self.percentage = 0
    }
    
}
