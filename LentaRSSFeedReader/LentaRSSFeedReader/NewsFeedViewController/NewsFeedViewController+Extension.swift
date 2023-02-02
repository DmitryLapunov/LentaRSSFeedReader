//
//  NewsFeedViewController+Extension.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

protocol NewsFeedViewProtocol: AnyObject {
    func presentNewsData(news: [NewsCellStructure])
}

extension NewsFeedViewController: NewsFeedViewProtocol {
    func presentNewsData(news: [NewsCellStructure]) {
        self.arrayOfNews = news
        DispatchQueue.main.async {
            self.controllerView.tableView.reloadData()
        }
    }
}
