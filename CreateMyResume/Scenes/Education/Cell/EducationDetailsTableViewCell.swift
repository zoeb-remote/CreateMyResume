//
//  EducationDetailsTableViewCell.swift
//  CreateMyResume
//
//  Created by Zoeb on 06/03/22.
//

import UIKit

protocol EducationDetailsTableViewCellProtocol: AnyObject {
    func didRemoveEducation(educationIndex: Int)
}

class EducationDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    var educationIndex: Int = 0
    weak var delegate: EducationDetailsTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction private func deleteButtonTapped(_ sender: UIButton) {
        delegate?.didRemoveEducation(educationIndex: educationIndex)
    }

}
