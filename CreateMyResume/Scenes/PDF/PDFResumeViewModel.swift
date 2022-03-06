//
//  PDFResumeViewModel.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import Foundation
import UIKit

struct PDFResumeInputModel {
    let resumeModel: ResumeModel
}

struct PDFResumeViewModel {
    enum Constants {
        static let previewVCIdentifier = "PreviewVC"
        static let phoneKey = "Phone: "
        static let emailKey = "Email: "
        static let percentageKey = "Percentage/CGPA"
        static let projectNameKey = "Project Name"
        static let teamSizeKey = "Team Size"
        static let technologyUsedKey = "Technology used: "
        static let roleKey = "Role: "
        static let systemFont = UIFont.systemFont(ofSize: 15.0)
        static let systemFontMedium = UIFont.systemFont(ofSize: 15, weight: .medium)
    }
    let resumeModel: ResumeModel
    
    var skillsText: String {
        var skills = ""
        for skill in resumeModel.skills.skillModels {
            if skills.isEmpty == false {
                skills = skills + ", "
            }
            skills = skills + skill.skill
        }
        
        return skills
    }
}
