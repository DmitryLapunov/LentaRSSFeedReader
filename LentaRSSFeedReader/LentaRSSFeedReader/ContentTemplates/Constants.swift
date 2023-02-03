//
//  Constants.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import UIKit

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
    
    enum NewsArticle {
        static let imageRadius: CGFloat = 6
        static let imageWidth: CGFloat = UIScreen.main.bounds.width - 32
        static let imageHeight: CGFloat = imageWidth / 1.5
    }
    
    enum Constraints {
        static let basicPositive: CGFloat = 16
        static let basicNegative: CGFloat = -16
        static let halfPositive: CGFloat = 8
        static let halfNegative: CGFloat = -8
        static let quarterPositive: CGFloat = 4
    }
    
    enum Label {
        static let infiniteLines = 0
        static let singleLine = 1
        static let threeLines = 3
    }
    
    enum StackView {
        static let zeroSpacing: CGFloat = 0
    }
}
