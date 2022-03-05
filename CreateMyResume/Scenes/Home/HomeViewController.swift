//
//  HomeViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private lazy var viewModel = HomeViewModel()
    private var selectedIndexPath: IndexPath!

    override func viewDidLoad() {
        super.viewDidLoad()
        let addBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        navigationItem.rightBarButtonItem = addBarButton
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ContentsViewController {
            if HomeViewModel.Constants.addContentsViewControllerIdentifier == segue.identifier {
               //TODO: delete this if not needed
            } else if HomeViewModel.Constants.modifyContentsViewControllerIdentifier == segue.identifier {
                let title = viewModel.resumes[selectedIndexPath.item]
                vc.title = title
            }
        }
    }
    
    @objc private func addTapped() {
        performSegue(withIdentifier: HomeViewModel.Constants.addContentsViewControllerIdentifier, sender: self)
     }

}

//MARK: - UITableViewDataSource and UITableViewDelegate

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.resumes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewModel.Constants.cellIdentifier, for: indexPath)
        
        //Default Content Configuration
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.resumes[indexPath.item]
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedIndexPath = indexPath
        performSegue(withIdentifier: HomeViewModel.Constants.modifyContentsViewControllerIdentifier, sender: self)
    }
    
    
}
