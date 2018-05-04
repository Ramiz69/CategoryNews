//
//  NewsTableViewCell.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class NewsTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "NewsCell"
    
    public var newsID: Int?
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    @IBOutlet weak private var descriptionLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        dateLabel.text = nil
        descriptionLabel.text = nil
    }
    
    public func configureCell(_ model: News) {
        newsID = model.id
        titleLabel.text = model.title
        dateLabel.text = String.stringFromDate(model.date)
        descriptionLabel.text = model.shortDescription
    }
    
}
