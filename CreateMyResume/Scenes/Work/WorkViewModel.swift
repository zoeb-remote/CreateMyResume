//
//  WorkViewModel.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import Foundation
import UIKit

struct WorkInputModel {
    let contentModel: WorkContentModel
}

class WorkViewModel {
    enum Constants {
        static let cellHeight: CGFloat = 140
        static let cellIdentifier = "CompanyDetailsTableViewCellIdentifier"
    }
    var contentModel: WorkContentModel
    
    init(contentModel: WorkContentModel) {
        self.contentModel = contentModel
    }
    
    var tableViewHeight: CGFloat {
        let count = CGFloat(self.contentModel.workModels.count)
        return Constants.cellHeight * count
    }
}
