//
//  AddProjectViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 06/03/22.
//

import UIKit

protocol AddProjectViewControllerProtocol: AnyObject {
    func didAddProject(model: AddProjectViewModel)
}

class AddProjectViewController: BaseViewController {
    @IBOutlet private weak var projectNameTextField: ValidatorTextField!
    @IBOutlet private weak var teamSizeTextField: ValidatorTextField!
    @IBOutlet private weak var summaryTextField: ValidatorTextField!
    @IBOutlet private weak var techUsedTextField: ValidatorTextField!
    @IBOutlet private weak var roleTextField: ValidatorTextField!
    
    private lazy var viewModel = AddProjectViewModel(contentModel: AddProjectModel())
    weak var delegate: AddProjectViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        viewModel.contentModel.projectName = projectNameTextField.text ?? ""
        viewModel.contentModel.teamSize = Int(teamSizeTextField.text ?? "1") ?? 1
        viewModel.contentModel.summary = summaryTextField.text ?? ""
        viewModel.contentModel.technologyUsed = techUsedTextField.text ?? ""
        viewModel.contentModel.role = roleTextField.text ?? ""
        
        delegate?.didAddProject(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
