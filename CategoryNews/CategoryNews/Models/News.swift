//
//  News.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import Foundation

class News: Hashable {
    
    static func ==(lhs: News, rhs: News) -> Bool {
        return lhs.title.hashValue == rhs.title.hashValue
    }
    
    let id: Int
    let title: String
    let date: String
    let shortDescription: String
    let fullDescription: String?
    var hashValue: Int {
        return title.hashValue
    }
    
    init(_ id: Int, title: String, date: String, shortDescription: String, fullDescription: String? = nil) {
        self.id = id
        self.title = title
        self.date = date
        self.shortDescription = shortDescription
        self.fullDescription = fullDescription
    }
}
