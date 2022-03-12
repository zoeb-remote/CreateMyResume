//
//  EducationViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class EducationViewController: BaseViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightLC: NSLayoutConstraint!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: EducationInputModel!
    private lazy var viewModel = EducationViewModel(contentModel: inputModel.contentModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddEducationViewController {
            vc.delegate = self
        }
    }
    
    private func refresh() {
        tableViewHeightLC.constant = viewModel.tableViewHeight
        self.view.layoutIfNeeded()
        self.tableView.reloadData()
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.projectDetails.rawValue)
    }
    
}

extension EducationViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel.contentModel.educationModels.count
        tableView.isHidden = count == 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EducationViewModel.Constants.cellIdentifier, for: indexPath) as? EducationDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        let model = self.viewModel.contentModel.educationModels[indexPath.item]
        cell.classLabel.text = model.classDetails + " (Year: \(model.passingYear))"
        cell.percentageLabel.text = "Percentage/CGPA: \(model.percentage)"
        cell.educationIndex = indexPath.item
        cell.delegate = self
        
        return cell
    }
}

extension EducationViewController: AddEducationViewControllerProtocol {
    func didAddEducation(model: AddEducationViewModel) {
        self.viewModel.contentModel.educationModels.append(model.contentModel)
        refresh()
    }
}

extension EducationViewController: EducationDetailsTableViewCellProtocol {
    func didRemoveEducation(educationIndex: Int) {
        self.viewModel.contentModel.educationModels.remove(at: educationIndex)
        refresh()
    }
}
