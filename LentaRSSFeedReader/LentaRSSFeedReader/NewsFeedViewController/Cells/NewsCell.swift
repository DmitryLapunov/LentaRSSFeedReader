//
//  NewsCell.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 2.02.23.
//

import UIKit
import Kingfisher

final class NewsCell: UITableViewCell {
    
    // MARK: - Class properties
    
    static let reuseIdentifier = "NewsCell"
    private var isRead: Bool = false
    
    // MARK: - UI elements
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.darkGray
        imageView.layer.cornerRadius = Constants.NewsCell.smallRadius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var isReadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = Colors.white
        imageView.layer.cornerRadius = Constants.NewsCell.largeRadius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.NewsFeed.newsTitle
        label.textColor = Colors.darkGray
        label.numberOfLines = Constants.Label.threeLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = Fonts.NewsFeed.newsDate
        label.textColor = Colors.lightGray
        label.numberOfLines = Constants.Label.singleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        backgroundColor = Colors.clear
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Cell setup methods
    
    private func setupSubviews() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(isReadImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func setConstraints() {
        newsImageView.widthAnchor.constraint(equalToConstant: Constants.NewsCell.imageWidth).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: Constants.NewsCell.imageHeight).isActive = true
        newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: Constants.Constraints.basicPositive).isActive = true
        newsImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: Constants.Constraints.basicNegative).isActive = true
        newsImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constants.Constraints.basicPositive).isActive = true
        
        isReadImageView.widthAnchor.constraint(equalToConstant: Constants.NewsCell.isReadSize).isActive = true
        isReadImageView.heightAnchor.constraint(equalToConstant: Constants.NewsCell.isReadSize).isActive = true
        isReadImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        isReadImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.Constraints.halfPositive).isActive = true
        
        titleLabel.leadingAnchor.constraint(equalTo: newsImageView.trailingAnchor,
                                            constant: Constants.Constraints.halfPositive).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                             constant: Constants.Constraints.basicNegative).isActive = true
        titleLabel.topAnchor.constraint(equalTo: newsImageView.topAnchor).isActive = true
        
        dateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                       constant: Constants.Constraints.quarterPositive).isActive = true
    }
    
    func setupCell(news: NewsCellStructure) {
        newsImageView.kf.setImage(with: URL(string: news.imageLink),
                                  placeholder: Images.System.placeholder)
        isReadImageView.image = news.isRead == false ? Images.System.exclamationmark : Images.System.checkmark
        isReadImageView.tintColor = news.isRead == false ? Colors.crimsonRed : Colors.lightGray
        titleLabel.text = news.title
        dateLabel.text = CustomDateFormatter.formatDate(unformattedDate: news.date)
    }
}
