//
//  String+DateFormatter.swift
//  CategoryNews
//
//  Created by Рамиз Кичибеков on 03.05.2018.
//  Copyright © 2018 Рамиз Кичибеков. All rights reserved.
//

import Foundation

extension String {
    static func stringFromDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar.autoupdatingCurrent
        dateFormatter.timeZone = TimeZone.autoupdatingCurrent
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.SSSZ"
        
        guard let date = dateFormatter.date(from: date) else { return "" }
        
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm"
        
        return dateFormatter.string(from:date)
    }
}
