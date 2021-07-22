//
//  DateExt.swift
//  Muvi
//
//  Created by Mirzayev Farid on 16.07.2021.
//

import SwiftUI

extension Date{
    
     static var thisYear: Int {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let component = formatter.string(from: Date())
        
        if let value = Int(component) {
            return value
        }
        return 0
    }
    
    private static func getComponent(date: Date, format: String) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = format
        formatter.locale = Locale.autoupdatingCurrent
           let component = formatter.string(from: date)
           return component
    }
    
    static func getFollowingThirtyDays(for month: Int = 1) -> [TicketDate]{
        var dates = [TicketDate]()
        let dateComponents = DateComponents(year: thisYear , month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
let range = calendar.range(of: .day, in: .month, for: date)!
        
        for i in range{
            guard let fullDate = calendar.date(byAdding: DateComponents(day: i) , to: Date()) else { continue }
            let d = getComponent(date: fullDate, format: "dd")
            let m = getComponent(date: fullDate, format: "MM")
            let y = getComponent(date: fullDate, format: "yy")
            let ticketDate = TicketDate(day: d, month: m, year: y)
            dates.append(ticketDate)
        }
        
        return dates
        
    }
}
