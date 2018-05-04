//
//  Categories.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import Foundation

struct Category {
    let name: String
    let id: Int
    
    init(_ id: Int, name: String) {
        self.id = id
        self.name = name
    }
    
}
