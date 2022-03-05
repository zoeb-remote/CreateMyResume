//
//  ResumeViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class ResumeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var viewModel = ResumeViewModel()
    private var selectedIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ContentsViewController {
            if ResumeViewModel.Constants.addContentsViewControllerIdentifier == segue.identifier {
               //TODO: delete this if not needed
            } else if ResumeViewModel.Constants.modifyContentsViewControllerIdentifier == segue.identifier {
                let title = viewModel.resumes[selectedIndexPath.item]
                vc.title = title
            }
        }
    }
    
    @objc private func addTapped() {
        performSegue(withIdentifier: ResumeViewModel.Constants.addContentsViewControllerIdentifier, sender: self)
     }

}

//MARK: - UITableViewDataSource and UITableViewDelegate

extension ResumeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.resumes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ResumeViewModel.Constants.cellIdentifier, for: indexPath)
        
        //Default Content Configuration
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.resumes[indexPath.item]
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndexPath = indexPath
        performSegue(withIdentifier: ResumeViewModel.Constants.modifyContentsViewControllerIdentifier, sender: self)
    }
    
    
}
