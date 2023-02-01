//
//  NewsFeedViewController.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 31.01.23.
//

import UIKit

final class NewsFeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let parser = CustomRSSParser()
        parser.startXMLParsing(url: URL(string: Contents.Networking.lentaRSSFeedURL) ?? URL(fileURLWithPath: "")) { arrayOfItems in
            print(arrayOfItems)
        }
    }
}
