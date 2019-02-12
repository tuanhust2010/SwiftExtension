//
//  Date+Extenstion.swift
//  SwiftExtension
//
//  Created by nguyen.manh.tuanb on 12/02/2019.
//  Copyright © 2019 nguyen.manh.tuanb. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
    
    func compareDay(byDate date: Date) -> Bool {
        let comparingDate = Calendar.current.startOfDay(for: self)
        let withDate = Calendar.current.startOfDay(for: date)
        return comparingDate.compare(withDate) == ComparisonResult.orderedSame
    }
}
