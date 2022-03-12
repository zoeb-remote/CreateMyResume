//
//  ContactViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var addressTextField: UITextField!
    
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
        viewModel.contentModel.mobile = phoneTextField.text ?? ""
        viewModel.contentModel.email = emailTextField.text ?? ""
        viewModel.contentModel.address = addressTextField.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.careerObjective.rawValue)
    }

}
