//
//  NewsFeedPresenter.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

protocol NewsFeedPresenterProtocol: AnyObject {
    func loadNewsData()
    func loadArticleData(newsCellStructure: NewsCellStructure)
    func toggleTableViewInteraction(isEnabled: Bool)
}

final class NewsFeedPresenter: NewsFeedPresenterProtocol {
    
    // MARK: - Class properties
    
    weak var view: NewsFeedViewProtocol?
    private let repository: NewsFeedRepositoryProtocol
    private let alertManager: AlertManager
    
    // MARK: - Init methods
    
    init(view: NewsFeedViewProtocol,
         repository: NewsFeedRepositoryProtocol = NewsFeedRepository(),
         alertManager: AlertManager) {
        self.view = view
        self.repository = repository
        self.alertManager = alertManager
    }
    
    // MARK: - Presenter data-handling methods
    
    func loadNewsData() {
        repository.parseFeed(url: URL(string: Contents.Networking.lentaRSSFeedURL) ?? URL(fileURLWithPath: "")) { result in
            switch result {
            case .success(let news):
                DispatchQueue.main.async {
                    self.view?.stopRefreshing()
                }
                self.view?.presentNewsData(news: news)
            case .failure(let error):
                self.alertManager.createAlert(message: error.localizedDescription)
            }
        }
    }
    
    func loadArticleData(newsCellStructure: NewsCellStructure) {
        repository.scrapeHtml(newsCellStructure: newsCellStructure) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articleStructure):
                self.view?.presentArticleData(articleStructure: articleStructure)
            case .failure(let error):
                self.alertManager.createAlert(message: error.localizedDescription)
            }
        }
    }
    
    func toggleTableViewInteraction(isEnabled: Bool) {
        view?.handleTableViewInteraction(isEnabled: isEnabled)
    }
}
