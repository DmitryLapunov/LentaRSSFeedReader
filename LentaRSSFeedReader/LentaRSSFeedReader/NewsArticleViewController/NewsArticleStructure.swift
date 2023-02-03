//
//  NewsArticleStructure.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation

struct NewsArticleStructure {
    let title: String
    let date: String
    let imageLink: String
    let articleParagraphs: [String]
    
    init(title: String,
         date: String,
         imageLink: String,
         articleParagraphs: [String]) {
        self.title = title
        self.date = date
        self.imageLink = imageLink
        self.articleParagraphs = articleParagraphs
    }
}
