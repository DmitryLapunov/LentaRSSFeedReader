//
//  NewsCellStructure.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

struct NewsCellStructure {
    let title: String
    let link: String
    let date: String
    let category: String
    let imageLink: String
    var isRead: Bool = false
    
    init(title: String,
         link: String,
         date: String,
         category: String,
         imageLink: String,
         isRead: Bool) {
        self.title = title
        self.link = link
        self.date = date
        self.category = category
        self.imageLink = imageLink
        self.isRead = isRead
    }
}
