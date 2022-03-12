//
//  AddWorkViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

protocol AddWorkViewControllerProtocol: AnyObject {
    func didAddWork(model: AddWorkViewModel)
}

class AddWorkViewController: BaseViewController {
    @IBOutlet private weak var companyTextField: ValidatorTextField!
    @IBOutlet private weak var durationTextField: ValidatorTextField!
    @IBOutlet private weak var isCurrentCompanySwitch: UISwitch!
    
    private lazy var viewModel = AddWorkViewModel(contentModel: AddWorkModel())
    weak var delegate: AddWorkViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        viewModel.contentModel.companyName = companyTextField.text ?? ""
        viewModel.contentModel.duration = durationTextField.text ?? ""
        viewModel.contentModel.isCurrentCompany = isCurrentCompanySwitch.isOn
        
        delegate?.didAddWork(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
