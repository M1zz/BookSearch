//
//  BookDetailView.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookDetailView: UIView {

    var isbn13: String!
    var webLink: String = ""
    
    let thumnailImageView = BSThumbnailImageView(frame: .zero)
    let titleLabel = BSTitleLabel(textAlignment: .center, fontSize: 20)
    let subtitleLabel = BSBodyLabel(textAlignment: .center)
    let authorsLabel = BSBodyLabel(textAlignment: .center)
    let publisherLabel = BSBodyLabel(textAlignment: .center)
    let languageLabel = BSBodyLabel(textAlignment: .center)
    let isbn10Label = BSBodyLabel(textAlignment: .center)
    let isbn13Label = BSBodyLabel(textAlignment: .center)
    let pagesLabel = BSBodyLabel(textAlignment: .center)
    let yearLabel = BSBodyLabel(textAlignment: .center)
    let ratingLabel = BSBodyLabel(textAlignment: .center)
    let descLabel = BSBodyLabel(textAlignment: .center)
    let priceLabel = BSBodyLabel(textAlignment: .center)
    let urlLabel = BSBodyLabel(textAlignment: .center)

    var itemViews: [UIView] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubviews(thumnailImageView, titleLabel, subtitleLabel,
                    authorsLabel, publisherLabel, languageLabel,
                    isbn10Label, isbn13Label, pagesLabel,
                    yearLabel, ratingLabel, descLabel,
                    priceLabel, urlLabel
        )
        
        itemViews = [titleLabel, subtitleLabel,
                             authorsLabel, publisherLabel, languageLabel,
                             isbn10Label, isbn13Label, pagesLabel,
                             yearLabel, ratingLabel, descLabel,
                             priceLabel, urlLabel]
        
        subtitleLabel.numberOfLines = 0
        descLabel.numberOfLines = 0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openWeb))
        urlLabel.isUserInteractionEnabled = true
        urlLabel.addGestureRecognizer(tapGesture)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            thumnailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            thumnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            thumnailImageView.heightAnchor.constraint(equalToConstant: 280),
            thumnailImageView.widthAnchor.constraint(equalToConstant: 240)
        ])
        
        
        var previousItemView: UIView = thumnailImageView
        for itemView in itemViews {
            NSLayoutConstraint.activate([
                itemView.topAnchor.constraint(equalTo: previousItemView.bottomAnchor, constant: 20),
                itemView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding)
            ])
            
            if itemView != descLabel {
                NSLayoutConstraint.activate([
                    itemView.heightAnchor.constraint(equalToConstant: 20)
                ])
            }
            
            previousItemView = itemView
        }
    }
    
    func set(with bookDetail: BookDetail) {
        thumnailImageView.downloadThumbnailImage(fromURL: bookDetail.image)
        titleLabel.text = bookDetail.title
        subtitleLabel.text = bookDetail.subtitle
        authorsLabel.text = "authors : \(bookDetail.authors)"
        publisherLabel.text = "publisher : \(bookDetail.publisher)"
        languageLabel.text = "language : \(bookDetail.language)"
        isbn10Label.text = "isbn10 : \(bookDetail.isbn10)"
        isbn13Label.text = "isbn13 : \(bookDetail.isbn13)"
        pagesLabel.text = "pages : \(bookDetail.pages)"
        yearLabel.text = "year : \(bookDetail.year)"
        ratingLabel.text = "rating : \(bookDetail.rating)"
        descLabel.text = "desc : \(bookDetail.desc)"
        priceLabel.text = "price : \(bookDetail.price)"
        
        makeOpenableLink(for: bookDetail.url)
        urlLabel.text = "url : \(bookDetail.url)"
    }
    
    
    
    private func makeOpenableLink(for link: String) {
        let attributedString = NSMutableAttributedString(string: link)
        attributedString.addAttribute(.link, value: link, range: NSRange(location: 0, length: link.count))
        webLink = link
        urlLabel.attributedText = attributedString
    }
    
    @objc private func openWeb() {
        
        if let url = URL(string: webLink) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url, options: [:])
            } else {
                
            }
        }
    }
    
}
