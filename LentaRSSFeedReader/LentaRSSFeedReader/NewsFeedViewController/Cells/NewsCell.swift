//
//  NewsCell.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import UIKit

final class NewsCell: UITableViewCell {
    
    // MARK: - Class properties
    
    static let reuseIdentifier = "NewsCell"
    private var isRead: Bool = false
    
    // MARK: - UI elements
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.image = UIImage(systemName: "photo")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .light)
        label.textColor = .systemGray
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = .clear
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Cell setup methods
    
    private func setupSubviews() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func setConstraints() {
        newsImageView.widthAnchor.constraint(equalToConstant: 90).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: 16).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -16).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: 16).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor,
                                            constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: -16).isActive = true
        titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                       constant: 4).isActive = true
    }
    
    func setupCell(news: NewsCellStructure) {
        titleLabel.text = news.title
        dateLabel.text = CustomDateFormatter.formatDate(unformattedDate: news.date)
    }
}
