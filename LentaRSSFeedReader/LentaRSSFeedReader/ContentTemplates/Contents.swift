//
//  Contents.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 31.01.23.
//

import Foundation

enum Contents {
    enum Networking {
        static let lentaRSSFeedURL = "https://lenta.ru/rss"
        static let elementItem = "item"
        static let elementTitle = "title"
        static let elementLink = "link"
        static let elementPubDate = "pubDate"
        static let elementCategory = "category"
        static let elementEnclosure = "enclosure"
        static let inlineKeyUrl = "url"
    }
}
