//
//  CustomError.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

extension LocalizedError where Self: CustomStringConvertible {
    var errorDescription: String? {
        return description
    }
}

final class CustomError: LocalizedError, CustomStringConvertible {
    let customDescription: String
    
    init(string: String) {
        customDescription = string
    }
    
    var description: String {
        let format = NSLocalizedString("%@", comment: "")
        return String.localizedStringWithFormat(format, customDescription)
    }
}
