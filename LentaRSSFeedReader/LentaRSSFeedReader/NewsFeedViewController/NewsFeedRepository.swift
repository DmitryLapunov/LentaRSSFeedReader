//
//  NewsFeedRepository.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import Foundation

typealias NewsListHandler = (Result<[NewsCellStructure], Error>) -> Void

protocol NewsFeedRepositoryProtocol: AnyObject {
    func parseFeed(url: URL, completion: @escaping NewsListHandler)
}

final class NewsFeedRepository: NewsFeedRepositoryProtocol {
    private let parser: CustomRSSParserProtocol
    
    init(parser: CustomRSSParserProtocol = CustomRSSParser()) {
        self.parser = parser
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
}
