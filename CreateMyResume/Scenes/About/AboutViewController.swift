//
//  AboutViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

protocol NextActionProtocol: AnyObject {
    func performNext(identifier: String)
}

class AboutViewController: BaseViewController {
    
    @IBOutlet private weak var userImageButton: UIButton!
    @IBOutlet private weak var firstNameTextField: ValidatorTextField!
    @IBOutlet private weak var lastNameTextField: ValidatorTextField!
    
    weak var delegate: NextActionProtocol?
    var imagePicker: ImagePicker!
    
    var inputModel: AboutInputModel!
    private lazy var viewModel = AboutViewModel(contentModel: inputModel.contentModel, resumeId: inputModel.resumeId)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup() {
        self.firstNameTextField.text = self.viewModel.contentModel.firstName
        self.lastNameTextField.text = self.viewModel.contentModel.lastName
        self.userImageButton.setImage(self.viewModel.userImage, for: .normal)
        
        DispatchQueue.background(completion: {
            self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        })
    }
    
    @IBAction private func addPhotoButtonTapped(_ sender: UIButton) {
        
        self.imagePicker.present(from: userImageButton)
    }
    
    @IBAction private func nextButtonTapped(_ sender: UIButton) {
        guard isFormValid else { return }
        
        viewModel.contentModel.firstName = firstNameTextField.text ?? ""
        viewModel.contentModel.lastName = lastNameTextField.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.contact.rawValue)
    }

}

extension AboutViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let image = image {
            userImageButton.setImage(image, for: .normal)
            let name = viewModel.resumeId
            do {
                try ImageStore.store(image: image, name: name)
                viewModel.contentModel.picture = name
            } catch {
                debugPrint("Unable to store image (\(error))")
            }
        }
    }
}
