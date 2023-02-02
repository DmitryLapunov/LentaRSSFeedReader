//
//  NewsFeedBuilder.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

final class NewsFeedBuilder {
    func build() -> NewsFeedViewController {
        let view = NewsFeedViewController()
        let presenter = NewsFeedPresenter(view: view)
        view.presenter = presenter
        return view
    }
}
