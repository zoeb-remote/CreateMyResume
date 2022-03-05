//
//  ContentsViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

struct ContentsInputModel {
    let resume: ResumeModel
}

class ContentsViewModel {
    let records = ["About", "Contact", "Career Objective", "Work", "Skills", "Education", "Project Details"]
    let cellIdentifier = "ContentsTableViewCell"
    let resume: ResumeModel
    
    enum ContentItem: String, CaseIterable {
        case about = "person.fill"
        case contact = "envelope.fill"
        case careerObjective = "star.circle.fill"
        case work = "case.fill"
        case skills = "hammer.fill"
        case education = "graduationcap.fill"
        case projectDetails = "book.fill"
    }
    
    enum SegueIdentifier: String, CaseIterable {
        case about = "AboutViewControllerIdentifier"
        case contact = "ContactViewControllerIdentifier"
        case careerObjective = "CareerObjectiveViewControllerIdentifier"
        case work = "WorkViewControllerIdentifier"
        case skills = "SkillsViewControllerIdentifier"
        case education = "EducationViewControllerIdentifier"
        case projectDetails = "ProjectDetailsViewControllerIdentifier"
    }
    
    init(resume: ResumeModel) {
        self.resume = resume
    }
}
