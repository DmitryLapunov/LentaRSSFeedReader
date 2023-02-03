//
//  CustomHtmlScraper.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import Foundation
import SwiftSoup

typealias HtmlTextHandler = (Result<[String], Error>) -> Void

protocol CustomHtmlScraperProtocol: AnyObject {
    func startHtmlScraping(url: URL, htmlTag: String, tagAttribute: String, attributeValue: String, completion: @escaping HtmlTextHandler)
}

final class CustomHtmlScraper: CustomHtmlScraperProtocol {
    func startHtmlScraping(url: URL, htmlTag: String, tagAttribute: String, attributeValue: String, completion: @escaping HtmlTextHandler) {
        DispatchQueue.global().async {
            do {
                let html = try String(contentsOf: url)
                let document: Document = try SwiftSoup.parse(html)
                let articleElements: Elements = try document.select(htmlTag)
                let arrayOfParagraphs: [Element] = try articleElements.filter({
                    try $0.attr(tagAttribute) == attributeValue
                })
                var scrapedParagraphs: [String] = []
                for paragraph in arrayOfParagraphs {
                    let text: String = try paragraph.text()
                    scrapedParagraphs.append(text)
                }
                completion(.success(scrapedParagraphs))
            } catch Exception.Error(let type, let message) {
                completion(.failure(Exception.Error(type: type, Message: message)))
            } catch {
                completion(.failure(CustomError(string: Contents.Networking.scrapingError)))
            }
        }
    }
}
