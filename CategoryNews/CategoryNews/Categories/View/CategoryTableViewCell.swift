//
//  CategoryTableViewCell.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 02.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CategoryCell"
    
    public var categoryID: Int?
    @IBOutlet weak private var categoryNameLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        categoryNameLabel.text = nil
    }
    
    public func configureCell(_ model: Category) {
        categoryID = model.id
        categoryNameLabel.text = model.name
    }
    
}
