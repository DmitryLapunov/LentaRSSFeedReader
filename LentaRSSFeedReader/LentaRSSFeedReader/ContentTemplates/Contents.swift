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
        static let parsingError = "Не удалось получить доступ к ленте RSS."
        static let scrapingError = "Ошибка получения данных новости."
        static let htmlTag = "p"
        static let tagAttribute = "class"
        static let attributeValue = "topic-body__content-text"
    }
}
