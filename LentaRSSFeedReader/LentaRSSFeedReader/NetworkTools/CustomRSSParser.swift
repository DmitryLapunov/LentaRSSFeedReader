//
//  CustomRSSParser.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 31.01.23.
//

import Foundation

typealias RSSFeedHandler = (Result<[[String]], Error>) -> Void

protocol CustomRSSParserProtocol: AnyObject {
    func startXMLParsing(url: URL, completion: @escaping RSSFeedHandler)
}

final class CustomRSSParser: NSObject, CustomRSSParserProtocol {
    var parser = XMLParser()
    var singleItem: [String] = []
    var arrayOfItems: [[String]] = []
    var currentElementName: String = ""
    var content: String = ""
    
    func startXMLParsing(url: URL, completion: @escaping RSSFeedHandler) {
        DispatchQueue.global().async {
            self.parser = XMLParser(contentsOf: url) ?? XMLParser()
            self.parser.delegate = self
            if self.parser.parse() == true {
                completion(.success(self.arrayOfItems))
            } else {
                let error = CustomError(string: "Не удалось получить доступ к ленте RSS.") as Error
                completion(.failure(error))
            }
        }
    }
}

extension CustomRSSParser: XMLParserDelegate {
    func parserDidStartDocument(_ parser: XMLParser) {
        arrayOfItems.removeAll()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == Contents.Networking.elementItem {
            singleItem.removeAll()
        } else if elementName == Contents.Networking.elementEnclosure {
            for (inlineKey, inlineValue) in attributeDict {
                if inlineKey == Contents.Networking.inlineKeyUrl {
                    singleItem.append(inlineValue)
                }
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElementName = elementName
        if elementName == Contents.Networking.elementTitle ||
            elementName == Contents.Networking.elementLink ||
            elementName == Contents.Networking.elementPubDate ||
            elementName == Contents.Networking.elementCategory {
            singleItem.append(content)
        } else if elementName == Contents.Networking.elementItem {
            arrayOfItems.append(singleItem)
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        content = string
    }
}
