//
//  WorkViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class WorkViewController: BaseViewController {
    
    @IBOutlet private weak var totalExperienceTextField: ValidatorTextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeightLC: NSLayoutConstraint!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: WorkInputModel!
    private lazy var viewModel = WorkViewModel(contentModel: inputModel.contentModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalExperienceTextField.text = viewModel.contentModel.totalExperience
        refresh()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? AddWorkViewController {
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
        
        viewModel.contentModel.totalExperience = totalExperienceTextField.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.skills.rawValue)
    }
    
}

extension WorkViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = self.viewModel.contentModel.workModels.count
        tableView.isHidden = count == 0
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WorkViewModel.Constants.cellIdentifier, for: indexPath) as? CompanyDetailsTableViewCell else {
            return UITableViewCell()
        }
        
        let model = self.viewModel.contentModel.workModels[indexPath.item]
        cell.companyNameLabel.text = model.companyName
        cell.durationLabel.text = model.duration
        cell.companyIndex = indexPath.item
        cell.delegate = self
        
        return cell
    }
}

extension WorkViewController: AddWorkViewControllerProtocol {
    func didAddWork(model: AddWorkViewModel) {
        self.viewModel.contentModel.workModels.append(model.contentModel)
        refresh()
    }
}

extension WorkViewController: CompanyDetailsViewProtocol {
    func didRemoveCompany(companyIndex: Int) {
        self.viewModel.contentModel.workModels.remove(at: companyIndex)
        refresh()
    }
}
