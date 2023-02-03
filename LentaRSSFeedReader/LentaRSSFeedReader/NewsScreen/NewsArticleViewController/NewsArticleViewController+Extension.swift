//
//  NewsArticleViewController+Extension.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation

protocol NewsArticleViewProtocol: AnyObject {
    func presentArticleData(articleStructure: NewsArticleStructure)
}

extension NewsArticleViewController: NewsArticleViewProtocol {
    func presentArticleData(articleStructure: NewsArticleStructure) {
        controllerView.setupView(articleStructure: articleStructure)
        controllerView.setNeedsDisplay()
    }
}
