//
//  Date+Ext.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 3.02.23.
//

import Foundation


extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
       
        return dateFormatter.string(from: self)
    }
}
