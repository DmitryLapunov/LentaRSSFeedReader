//
//  NewsArticlePresenter.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation

protocol NewsArticlePresenterProtocol: AnyObject {
    func loadArticleData()
}

final class NewsArticlePresenter: NewsArticlePresenterProtocol {
    
    // MARK: - Class properties
    
    weak var view: NewsArticleViewProtocol?
    private let articleStructure: NewsArticleStructure
    
    // MARK: - Init method
    
    init(view: NewsArticleViewProtocol,
         articleStructure: NewsArticleStructure) {
        self.view = view
        self.articleStructure = articleStructure
    }
    
    // MARK: - Presenter data-handling methods
    
    func loadArticleData() {
        view?.presentArticleData(articleStructure: articleStructure)
    }
}
