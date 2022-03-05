//
//  AboutViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

protocol NextActionProtocol: class {
    func performNext(identifier: String)
}

class AboutViewController: UIViewController {
    
    @IBOutlet weak var userImageButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    weak var delegate: NextActionProtocol?
    var imagePicker: ImagePicker!
    
    var inputModel: AboutInputModel!
    private lazy var viewModel = AboutViewModel(contentModel: inputModel.contentModel)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.firstNameTextField.text = self.viewModel.contentModel.firstName
            self.lastNameTextField.text = self.viewModel.contentModel.lastName
            self.userImageButton.setImage(self.viewModel.userImage, for: .normal)
        }
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    @IBAction func addPhotoButtonTapped(_ sender: UIButton) {
        
        self.imagePicker.present(from: userImageButton)
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        viewModel.contentModel.firstName = firstNameTextField.text ?? ""
        viewModel.contentModel.lastName = lastNameTextField.text ?? ""
        delegate?.performNext(identifier: ContentsViewModel.SegueIdentifier.contact.rawValue)
    }

}

extension AboutViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if let image = image {
            userImageButton.setImage(image, for: .normal)
            let name = UUID().uuidString
            debugPrint("UUID: " + name)
            do {
                try ImageStore.store(image: image, name: name)
                viewModel.contentModel.picture = name
            } catch {
                debugPrint("Unable to store image (\(error))")
            }
        }
    }
}
