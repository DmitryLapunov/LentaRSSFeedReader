//
//  NewsArticleView.swift
//  LentaRSSFeedReader
//
//  Created by Дмитрий Лапунов on 3.02.23.
//

import UIKit
import Kingfisher

class NewsArticleView: UIView {
    
    // MARK: - UI elements
    
    private lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.showsVerticalScrollIndicator = false
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = Constants.StackView.zeroSpacing
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var contentView = UIView()
    
    private lazy var newsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Colors.darkGray
        imageView.layer.cornerRadius = Constants.NewsArticle.imageRadius
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var articleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = Constants.Label.infiniteLines
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = Colors.white
        setupSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - UIView setup methods
    
    private func setupSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(contentView)
        contentView.addSubview(newsImageView)
        contentView.addSubview(articleLabel)
    }
    
    private func setConstraints() {
        scrollView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        
        newsImageView.widthAnchor.constraint(equalToConstant: Constants.NewsArticle.imageWidth).isActive = true
        newsImageView.heightAnchor.constraint(equalToConstant: Constants.NewsArticle.imageHeight).isActive = true
        newsImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        newsImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: Constants.Constraints.basicPositive).isActive = true
        
        articleLabel.topAnchor.constraint(equalTo: newsImageView.bottomAnchor,
                                          constant: Constants.Constraints.halfPositive).isActive = true
        articleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                              constant: Constants.Constraints.basicPositive).isActive = true
        articleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                               constant: Constants.Constraints.basicNegative).isActive = true
        articleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                             constant: Constants.Constraints.halfNegative).isActive = true
    }
    
    func setupView(articleStructure: NewsArticleStructure) {
        newsImageView.kf.setImage(with: URL(string: articleStructure.imageLink),
                                  placeholder: Images.System.placeholder)
        articleLabel.attributedText = setupAttributedArticle(articleStructure: articleStructure)
    }
    
    private func setupAttributedArticle(articleStructure: NewsArticleStructure) -> NSAttributedString {
        let article = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 8
        
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: Fonts.NewsArticle.newsTitle as Any,
            .foregroundColor: Colors.darkGray,
            .paragraphStyle: paragraphStyle
        ]
        
        let dateAttributes: [NSAttributedString.Key: Any] = [
            .font: Fonts.NewsArticle.newsDate as Any,
            .foregroundColor: Colors.lightGray,
            .paragraphStyle: paragraphStyle
        ]
        
        let articleAttributes: [NSAttributedString.Key: Any] = [
            .font: Fonts.NewsArticle.newsArticle as Any,
            .foregroundColor: Colors.darkGray,
            .paragraphStyle: paragraphStyle
        ]
        
        let attributedTitle = NSAttributedString(string: articleStructure.title,
                                                 attributes: titleAttributes)
        let attributedDate = NSAttributedString(string: Contents.Basic.paragraphSeparator + CustomDateFormatter.formatDate(unformattedDate: articleStructure.date),
                                                attributes: dateAttributes)
        let articleText = articleStructure.articleParagraphs
            .joined(separator: Contents.Basic.paragraphSeparator)
        let attributedArticle = NSAttributedString(string: Contents.Basic.paragraphSeparator + articleText,
                                                   attributes: articleAttributes)
        
        article.append(attributedTitle)
        article.append(attributedDate)
        article.append(attributedArticle)
        
        return article
    }
}
