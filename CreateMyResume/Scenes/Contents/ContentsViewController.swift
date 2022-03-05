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
        
        cell.contentConfiguration = content
        return cell
    }
    
    
}
