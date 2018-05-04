//
//  NewsTableViewController.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class NewsTableViewController: UITableViewController {
    
    public var categoryID: Int?
    public var news = [News]()
    public var currentPage = 0
    
    private var operation: OperationGetNews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        operation?.cancel()
    }
    
    //MARK: - Custom methods
    //MARK: - Public methods
    
    public func loadMoreData() {
        showActivityIndicator()
        guard let categoryID = categoryID else { return }
        operation = OperationGetNews(with: categoryID, onPage: currentPage)
        operation?.completionBlock = {
            guard let news = self.operation?.news else { return }
            self.currentPage += 1
            for news in news {
                self.news.append(news)
            }
            let index = self.news.count - news.count
            var newIndexPaths = [IndexPath]()
            for i in index..<self.news.count {
                newIndexPaths.append(IndexPath(row: i, section: 0))
            }
            self.executeOnMainThread { [weak self] in
                self?.removeActivityIndicator()
                self?.tableView.beginUpdates()
                self?.tableView.insertRows(at: newIndexPaths, with: .automatic)
                self?.tableView.endUpdates()
            }
        }
    }
    
    //MARK: - Private methods
    private func configureController() {
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 1))
        tableView.register(UINib(nibName: String(describing: NewsTableViewCell.self), bundle: nil), forCellReuseIdentifier: NewsTableViewCell.reuseIdentifier)
        getData()
    }
    
    private func getData() {
        showActivityIndicator()
        guard let categoryID = categoryID else { return }
        operation = OperationGetNews(with: categoryID, onPage: currentPage)
        operation?.completionBlock = {
            guard let news = self.operation?.news else { return }
            self.currentPage += 1
            self.news = news
            self.executeOnMainThread { [weak self] in
                self?.removeActivityIndicator()
                self?.tableView.reloadData()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailNewsViewController {
            guard let newsID = sender as? Int else { return }
            destination.newsID = newsID
        }
    }

}
