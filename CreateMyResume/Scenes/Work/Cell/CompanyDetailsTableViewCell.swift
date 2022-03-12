//
//  CompanyDetailsView.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

protocol CompanyDetailsViewProtocol: AnyObject {
    func didRemoveCompany(companyIndex: Int)
}

class CompanyDetailsTableViewCell: UITableViewCell {
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    var companyIndex: Int = 0
    weak var delegate: CompanyDetailsViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction private func deleteButtonTapped(_ sender: UIButton) {
        delegate?.didRemoveCompany(companyIndex: companyIndex)
    }

}
