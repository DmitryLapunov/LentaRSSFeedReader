//
//  NewsFeedViewDelegate.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation

protocol NewsFeedViewDelegate: AnyObject {
    func refreshNewsData()
}

extension NewsFeedViewController: NewsFeedViewDelegate {
    func refreshNewsData() {
        presenter?.loadNewsData()
    }
}
