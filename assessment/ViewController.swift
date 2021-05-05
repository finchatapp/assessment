//
//  ViewController.swift
//  assessment
//
//  Created by Bryan Nguyen on 5/5/21.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - ViewModel
    
    var viewModel: ViewModel = ViewModel()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
                
        configure()
    }
    
    // MARK: - Configuration
    
    private func configure() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.cellId)
    }
    
    // MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.cellId, for: indexPath) as! TableViewCell
        
        cell.setup(index: indexPath.row)
        
        viewModel.fetchImage(forIndex: indexPath.row) { (image, index) in
            cell.configure(image: image, index: index)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

