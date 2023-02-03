//
//  NewsFeedViewController.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 31.01.23.
//

import UIKit

final class NewsFeedViewController: UIViewController {
    
    // MARK: - Class properties
    
    var presenter: NewsFeedPresenterProtocol?
    let controllerView = NewsFeedView()
    var arrayOfNews: [NewsCellStructure] = []
    
    // MARK: - UIViewController events
    
    override func loadView() {
        super.loadView()
        self.view = controllerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        presenter?.loadNewsData()
    }
    
    // MARK: - Init methods
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience init?(coder: NSCoder) {
        self.init()
    }
    
    // MARK: - UIViewController setup
    
    private func setupView() {
        controllerView.tableView.dataSource = self
        controllerView.tableView.delegate = self
        controllerView.newsFeedViewDelegate = self
    }
}
