//
//  DateExtention.swift
//  ABTodoList
//
//  Created by Andriy Biguniak on 01.12.2020.
//

import Foundation

extension Date {
    var onlyDate: Date {
        get {
            let calender = Calendar.current
            let dateComponents = calender.dateComponents([.year, .month, .day], from: self)
//            dateComponents.timeZone = NSTimeZone.system
            return calender.date(from: dateComponents) ?? Date()
        }
    }
    
    func getDateInString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let date = dateFormatter.string(from: self)
        return date
    }
    
    func getTimeInString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.string(from: self)
        return date
    }
}
