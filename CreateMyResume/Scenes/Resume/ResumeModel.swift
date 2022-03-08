//
//  ResumeModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ResumeModel: Codable {
    let resumeId: String
    var title: String
    let about: AboutContentModel
    let contact: ContactContentModel
    let careerObjective: CareerObjectiveContentModel
    let workSummary: WorkContentModel
    let skills: SkillContentModel
    let educationDetails: EducationContentModel
    let projectDetails: ProjectDetailsContentModel
    
    init() {
        self.resumeId = UUID().uuidString
        self.title = ""
        self.about = AboutContentModel()
        self.contact = ContactContentModel()
        self.careerObjective = CareerObjectiveContentModel()
        self.workSummary = WorkContentModel()
        self.skills = SkillContentModel()
        self.educationDetails = EducationContentModel()
        self.projectDetails = ProjectDetailsContentModel()
    }
}
