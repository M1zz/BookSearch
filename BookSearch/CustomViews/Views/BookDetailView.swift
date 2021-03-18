//
//  BookDetailView.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookDetailView: UIView {

    var isbn13: String!
    
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

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(thumnailImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(authorsLabel)
        addSubview(publisherLabel)
        addSubview(languageLabel)
        addSubview(isbn10Label)
        addSubview(isbn13Label)
        addSubview(pagesLabel)
        addSubview(yearLabel)
        addSubview(ratingLabel)
        addSubview(descLabel)
        addSubview(priceLabel)
        addSubview(urlLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            thumnailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            thumnailImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            thumnailImageView.heightAnchor.constraint(equalToConstant: 140),
            thumnailImageView.widthAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: thumnailImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20),

            isbn13Label.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            isbn13Label.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            isbn13Label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            isbn13Label.heightAnchor.constraint(equalToConstant: 20),

            priceLabel.topAnchor.constraint(equalTo: isbn13Label.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),

            urlLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            urlLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            urlLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            urlLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func set(with bookDetail: BookDetail) {
        thumnailImageView.downloadThumbnailImage(fromURL: bookDetail.image)
        titleLabel.text = bookDetail.title
        subtitleLabel.text = bookDetail.subtitle
        
        isbn13Label.text = bookDetail.isbn13
        priceLabel.text = bookDetail.price
        urlLabel.text = bookDetail.url
        print(titleLabel.text)
    }
    
}
