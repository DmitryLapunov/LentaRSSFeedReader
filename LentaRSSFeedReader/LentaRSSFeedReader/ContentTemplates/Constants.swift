//
//  Constants.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation

enum Constants {
    enum NewsFeedView {
        static let rowHeight: CGFloat = 92
        static let separatorZeroInset: CGFloat = 0
        static let separatorLeading: CGFloat = 114
    }
    
    enum NewsCell {
        static let largeRadius: CGFloat = 8
        static let smallRadius: CGFloat = 4
        static let imageWidth: CGFloat = 90
        static let imageHeight: CGFloat = 60
        static let isReadSize: CGFloat = 16
    }
    
    enum Constraints {
        static let basicPositive: CGFloat = 16
        static let basicNegative: CGFloat = -16
        static let halfPositive: CGFloat = 8
        static let quarterPositive: CGFloat = 4
    }
    
    enum Label {
        static let infiniteLines = 0
        static let singleLine = 1
        static let threeLines = 3
    }
}
