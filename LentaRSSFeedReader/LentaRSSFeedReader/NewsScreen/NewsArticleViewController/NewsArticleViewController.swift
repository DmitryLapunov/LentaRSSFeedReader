//
//  NewsArticleViewController.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import UIKit

class NewsArticleViewController: UIViewController {
    
    // MARK: - Class properties
    
    var presenter: NewsArticlePresenterProtocol?
    let controllerView = NewsArticleView()
    
    // MARK: - UIViewController events
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadArticleData()
    }
    
    // MARK: - Init methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
}
