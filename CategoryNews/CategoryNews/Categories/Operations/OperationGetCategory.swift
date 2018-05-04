//
//  OperationGetCategory.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import UIKit

final class OperationGetCategory: Operation {
    
    public var categories: [Category]?
    
    override init() {
        super.init()
        cancelOperation()
        main()
    }
    
    override func main() {
        cancelOperation()
        NetworkManager.getCategories { (results, error) in
            guard
                let list = results as? JSON,
                let items = list["list"] as? [JSON],
                error == nil
                else {
                return
            }
            self.categories = [Category]()
            for item in items {
                self.cancelOperation()
                guard
                    let id = item["id"] as? Int,
                    let name = item["name"] as? String
                    else {
                    return
                }
                let category = Category(id, name: name)
                self.categories?.append(category)
            }
            guard let completionBlock = self.completionBlock else {
                return
            }
            completionBlock()
        }
    }
    
    override func cancel() {
        super.cancel()
        cancelOperation()
    }
    
}
