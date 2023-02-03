//
//  NewsFeedViewController+TableView.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import UIKit

extension NewsFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath)
        let newsCell = cell as? NewsCell
        newsCell?.setupCell(news: arrayOfNews[indexPath.row])
        return newsCell ?? UITableViewCell()
    }
}

extension NewsFeedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.toggleTableViewInteraction(isEnabled: false)
        arrayOfNews[indexPath.row].isRead = true
        tableView.reloadRows(at: [indexPath], with: .none)
        presenter?.loadArticleData(newsCellStructure: arrayOfNews[indexPath.row])
    }
}
