//
//  OperationGetDetailNews.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 04.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class OperationGetDetailNews: Operation {
    
    public var news: News?
    private var newsID: Int
    
    init(with newsID: Int) {
        self.newsID = newsID
        super.init()
        cancelOperation()
        main()
    }
    
    override func main() {
        cancelOperation()
        NetworkManager.getDetailNewsByNumber(newsID) { (results, error) in
            guard
                let response = results as? JSON,
                let news = response["news"] as? JSON,
                error == nil,
                let id = news["id"] as? Int,
                let title = news["title"] as? String,
                let date = news["date"] as? String,
                let shortDescription = news["shortDescription"] as? String,
                let fullDescription = news["fullDescription"] as? String
                else {
                    return
            }
            self.cancelOperation()
            self.news = News(id, title: title, date: date, shortDescription: shortDescription, fullDescription: fullDescription)
            guard let completionBlock = self.completionBlock else { return }
            completionBlock()
        }
    }
    
    override func cancel() {
        super.cancel()
        cancelOperation()
    }
    
}
