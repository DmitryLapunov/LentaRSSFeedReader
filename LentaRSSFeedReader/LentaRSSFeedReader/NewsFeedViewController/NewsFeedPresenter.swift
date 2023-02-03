//
//  NewsFeedPresenter.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

protocol NewsFeedPresenterProtocol: AnyObject {
    func loadNewsData()
}

final class NewsFeedPresenter: NewsFeedPresenterProtocol {
    
    // MARK: - Class properties
    
    weak var view: NewsFeedViewProtocol?
    private let repository: NewsFeedRepositoryProtocol
    
    // MARK: - Init methods
    
    init(view: NewsFeedViewProtocol, repository: NewsFeedRepositoryProtocol = NewsFeedRepository()) {
        self.view = view
        self.repository = repository
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
                print(error.localizedDescription)
            }
        }
    }
}
