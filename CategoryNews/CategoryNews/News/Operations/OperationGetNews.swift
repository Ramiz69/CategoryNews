//
//  OperationGetNews.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class OperationGetNews: Operation {
    
    public var news: [News]?
    private let categoryID: Int
    private let page: Int
    
    init(with categoryID: Int, onPage: Int) {
        self.categoryID = categoryID
        page = onPage
        super.init()
        cancelOperation()
        main()
    }
    
    override func main() {
        cancelOperation()
        NetworkManager.getNewsByNumber(categoryID, page: page) { (results, error) in
            guard
                let list = results as? JSON,
                let items = list["list"] as? [JSON],
                error == nil
                else {
                    return
            }
            self.news = [News]()
            for item in items {
                self.cancelOperation()
                guard
                    let id = item["id"] as? Int,
                    let title = item["title"] as? String,
                    let date = item["date"] as? String,
                    let description = item["shortDescription"] as? String
                    else {
                        return
                }
                let news = News(id, title: title, date: date, shortDescription: description)
                self.news?.append(news)
            }
            guard let completionBlock = self.completionBlock else { return }
            completionBlock()
        }
    }
    
    override func cancel() {
        super.cancel()
        cancelOperation()
    }
    
}
