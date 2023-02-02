//
//  CustomDateFormatter.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

final class CustomDateFormatter {
    
    /// Method to format parsed raw date into a readable string.
    
    static func formatDate(unformattedDate: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        let pubDate = dateFormatterGet.date(from: String(unformattedDate))
        let dateFormatterSet = DateFormatter()
        dateFormatterSet.locale = Locale(identifier: "ru")
        dateFormatterSet.dateFormat = "HH:mm, d MMMM yyyy"
        let pubDateFormatted = dateFormatterSet.string(from: pubDate ?? Date())
        return pubDateFormatted
    }
}
