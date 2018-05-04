//
//  Array.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 05.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    var orderedSet: Array  {
        var set = Set<Element>()
        return filter { set.insert($0).inserted }
    }
}
