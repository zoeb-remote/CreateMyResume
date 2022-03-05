//
//  ContentsViewController.swift
//  CreateMyResume
//
//  Created by Zoeb on 05/03/22.
//

import UIKit

class ContentsViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var inputModel: ContentsInputModel!
    private lazy var viewModel = ContentsViewModel(resume: inputModel.resume)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

//MARK: - UITableViewDataSource and UITableViewDelegate

extension ContentsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath)
        
        //Default Content Configuration
        var content = cell.defaultContentConfiguration()
        content.text = viewModel.records[indexPath.item]
        let imageName = ContentsViewModel.ContentItem.allCases[indexPath.item].rawValue
        content.image = UIImage(systemName: imageName)
        
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let identifier = ContentsViewModel.SegueIdentifier.allCases[indexPath.item].rawValue
        performSegue(withIdentifier: identifier, sender: self)
    }
}
