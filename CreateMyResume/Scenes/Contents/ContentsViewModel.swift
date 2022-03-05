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

struct ContentsViewModel {
    let records = ["About", "Contact", "Career Objective", "Work", "Skills", "Education", "Project Details"]
    let cellIdentifier = "ContentsTableViewCell"
    let resume: ResumeModel
}
