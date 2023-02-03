//
//  Fonts.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import UIKit

enum Fonts {
    enum NewsFeed {
        static let newsTitle = UIFont(name: LatoFont.regular, size: 14)
        static let newsDate = UIFont(name: LatoFont.light, size: 10)
    }
    
    enum NewsArticle {
        static let newsTitle = UIFont(name: LatoFont.bold, size: 18)
        static let newsDate = UIFont(name: LatoFont.light, size: 14)
        static let newsArticle = UIFont(name: LatoFont.regular, size: 14)
    }
}
