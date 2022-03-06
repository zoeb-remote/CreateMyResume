//
//  AddProjectViewController.swift
//  CreateMyResume
//
//  Created by Bigsur on 06/03/22.
//

import UIKit

protocol AddProjectViewControllerProtocol: class {
    func didAddProject(model: AddProjectViewModel)
}

class AddProjectViewController: UIViewController {
    @IBOutlet private weak var projectNameTextField: UITextField!
    @IBOutlet private weak var teamSizeTextField: UITextField!
    @IBOutlet private weak var summaryTextField: UITextField!
    @IBOutlet private weak var techUsedTextField: UITextField!
    @IBOutlet private weak var roleTextField: UITextField!
    
    private lazy var viewModel = AddProjectViewModel(contentModel: AddProjectModel())
    weak var delegate: AddProjectViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        viewModel.contentModel.projectName = projectNameTextField.text ?? ""
        viewModel.contentModel.teamSize = Int(teamSizeTextField.text ?? "1") ?? 1
        viewModel.contentModel.summary = summaryTextField.text ?? ""
        viewModel.contentModel.technologyUsed = techUsedTextField.text ?? ""
        viewModel.contentModel.role = roleTextField.text ?? ""
        
        delegate?.didAddProject(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
