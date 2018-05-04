//
//  DetailNewsViewController.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 04.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class DetailNewsViewController: UIViewController {
    
    public var newsID: Int?
    
    private var operation: OperationGetDetailNews?
    @IBOutlet weak private var shortDescriptionLabel: UILabel!
    @IBOutlet weak private var fullDescriptionTextView: UITextView!
    @IBOutlet weak private var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureController()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        operation?.cancel()
    }
    
    //MARK: - Custom methods
    
    private func configureController() {
        guard let newsID = newsID else { return }
        showActivityIndicator()
        operation = OperationGetDetailNews(with: newsID)
        operation?.completionBlock = {
            self.removeActivityIndicator()
            guard let news = self.operation?.news else { return }
            self.executeOnMainThread { [weak self] in
                self?.title = news.title
                self?.shortDescriptionLabel.text = news.shortDescription
                self?.dateLabel.text = String.stringFromDate(news.date)
                self?.fullDescriptionTextView.attributedText = news.fullDescription?.htmlToAttributedString
            }
        }
    }
    
}
