//
//  NewsArticleBuilder.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation

final class NewsArticleBuilder {
    func build(articleStructure: NewsArticleStructure) -> NewsArticleViewController {
        let view = NewsArticleViewController()
        let presenter = NewsArticlePresenter(view: view, articleStructure: articleStructure)
        view.presenter = presenter
        return view
    }
}
