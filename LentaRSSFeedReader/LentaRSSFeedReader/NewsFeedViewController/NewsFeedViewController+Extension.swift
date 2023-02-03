//
//  NewsFeedViewController+Extension.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

protocol NewsFeedViewProtocol: AnyObject {
    func presentNewsData(news: [NewsCellStructure])
    func stopRefreshing()
    func presentArticleData(articleStructure: NewsArticleStructure)
    func handleTableViewInteraction(isEnabled: Bool)
}

extension NewsFeedViewController: NewsFeedViewProtocol {
    func presentNewsData(news: [NewsCellStructure]) {
        var parsedNews = news
        if self.arrayOfNews.count > 0 {
            for newsItem in parsedNews where self.arrayOfNews.filter({ $0.title == newsItem.title && $0.isRead != newsItem.isRead }).count > 0 {
                let index = parsedNews.firstIndex { news in
                    news.title == newsItem.title
                }
                parsedNews[index ?? 0].isRead.toggle()
            }
            self.arrayOfNews = parsedNews
        } else {
            self.arrayOfNews = news
        }
        DispatchQueue.main.async {
            self.controllerView.tableView.reloadData()
        }
    }
    
    func stopRefreshing() {
        controllerView.stopRefreshing()
    }
    
    func presentArticleData(articleStructure: NewsArticleStructure) {
    }
    
    func handleTableViewInteraction(isEnabled: Bool) {
        controllerView.tableView.isUserInteractionEnabled = isEnabled
    }
}
