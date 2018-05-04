//
//  CategoriesTableViewController.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 02.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class CategoriesTableViewController: UITableViewController {
    
    public var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    //MARK: - Custom methods
    
    private func configureController() {
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        tableView.register(UINib(nibName: String(describing: CategoryTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: CategoryTableViewCell.reuseIdentifier)
        getData()
    }
    
    private func getData() {
        showActivityIndicator()
        let operation = OperationGetCategory()
        operation.completionBlock = {
            guard let categories = operation.categories else { return }
            self.categories = categories
            self.executeOnMainThread { [weak self] in
                self?.removeActivityIndicator()
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? NewsTableViewController {
            guard let categoryID = sender as? Int else { return }
            destination.categoryID = categoryID
        }
    }
}
