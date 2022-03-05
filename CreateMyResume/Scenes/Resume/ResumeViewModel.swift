//
//  ResumeViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation

class ResumeViewModel {
    var resumes: [ResumeModel]? {
        return ResumeModel.readResumes()
    }
    var resumesCount: Int {
        resumes?.count ?? 0
    }
    enum Constants {
        static let cellIdentifier = "ResumeTableViewCell"
        static let addContentsViewControllerIdentifier = "AddContentsViewControllerIdentifier"
        static let modifyContentsViewControllerIdentifier = "ModifyContentsViewControllerIdentifier"
    }
    
    
    
}
