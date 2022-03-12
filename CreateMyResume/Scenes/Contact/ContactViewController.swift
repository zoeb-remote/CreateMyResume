//
//  ContactViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class ContactViewController: BaseViewController {
    
    @IBOutlet private weak var phoneTextField: ValidatorTextField!
    @IBOutlet private weak var emailTextField: ValidatorTextField!
    @IBOutlet private weak var addressTextField: ValidatorTextField!
    
    weak var delegate: NextActionProtocol?
    
    var inputModel: ContactInputModel!
    private lazy var viewModel = ContactViewModel(contentModel: inputModel.contentModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneTextField.text = viewModel.contentModel.mobile
        emailTextField.text = viewModel.contentModel.email
        addressTextField.text = viewModel.contentModel.address
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        viewModel.contentModel.mobile = phoneTextField.text ?? ""
        viewModel.contentModel.email = emailTextField.text ?? ""
        viewModel.contentModel.address = addressTextField.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.careerObjective.rawValue)
    }

}
