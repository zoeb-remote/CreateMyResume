//
//  AddWorkViewController.swift
//  CreateMyResume
//
//  Created by Bigsur on 05/03/22.
//

import UIKit

protocol AddWorkViewControllerProtocol: class {
    func didAddWork(model: AddWorkViewModel)
}

class AddWorkViewController: UIViewController {
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var durationTextField: UITextField!
    @IBOutlet weak var isCurrentCompanySwitch: UISwitch!
    
    private lazy var viewModel = AddWorkViewModel(contentModel: AddWorkModel())
    weak var delegate: AddWorkViewControllerProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        viewModel.contentModel.companyName = companyTextField.text ?? ""
        viewModel.contentModel.duration = durationTextField.text ?? ""
        viewModel.contentModel.isCurrentCompany = isCurrentCompanySwitch.isOn
        
        delegate?.didAddWork(model: viewModel)
        self.dismiss(animated: true, completion: nil)
    }

}
