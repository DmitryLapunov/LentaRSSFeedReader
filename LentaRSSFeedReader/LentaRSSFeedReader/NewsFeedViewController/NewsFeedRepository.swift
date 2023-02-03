//
//  NewsFeedRepository.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

typealias NewsListHandler = (Result<[NewsCellStructure], Error>) -> Void
typealias NewsArticleHandler = (Result<NewsArticleStructure, Error>) -> Void

protocol NewsFeedRepositoryProtocol: AnyObject {
    func parseFeed(url: URL, completion: @escaping NewsListHandler)
    func scrapeHtml(newsCellStructure: NewsCellStructure, completion: @escaping NewsArticleHandler)
}

final class NewsFeedRepository: NewsFeedRepositoryProtocol {
    private let parser: CustomRSSParserProtocol
    private let scraper: CustomHtmlScraperProtocol
    
    init(parser: CustomRSSParserProtocol = CustomRSSParser(),
         scraper: CustomHtmlScraperProtocol = CustomHtmlScraper()) {
        self.parser = parser
        self.scraper = scraper
    }
    
    func parseFeed(url: URL, completion: @escaping NewsListHandler) {
        parser.startXMLParsing(url: url) { result in
            switch result {
            case .success(let arrayOfItems):
                let news = arrayOfItems.map({ NewsCellStructure(title: $0[0],
                                                                link: $0[1],
                                                                date: $0[2],
                                                                category: $0[4],
                                                                imageLink: $0[3],
                                                                isRead: false) })
                completion(.success(news))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func scrapeHtml(newsCellStructure: NewsCellStructure, completion: @escaping NewsArticleHandler) {
        scraper.startHtmlScraping(url: URL(string: newsCellStructure.link) ?? URL(fileURLWithPath: ""),
                                  htmlTag: Contents.Networking.htmlTag,
                                  tagAttribute: Contents.Networking.tagAttribute,
                                  attributeValue: Contents.Networking.attributeValue) { result in
            switch result {
            case .success(let articleParagraphs):
                let articleStructure = NewsArticleStructure(title: newsCellStructure.title,
                                                            date: newsCellStructure.date,
                                                            imageLink: newsCellStructure.imageLink,
                                                            articleParagraphs: articleParagraphs)
                completion(.success(articleStructure))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
