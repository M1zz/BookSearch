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
    //let urlLabel = UITextView(frame: .zero, textContainer: .none)
    
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
            thumnailImageView.widthAnchor.constraint(equalToConstant: 240),
            
            titleLabel.topAnchor.constraint(equalTo: thumnailImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            authorsLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 20),
            authorsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            authorsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            authorsLabel.heightAnchor.constraint(equalToConstant: 20),
            
            publisherLabel.topAnchor.constraint(equalTo: authorsLabel.bottomAnchor, constant: 20),
            publisherLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            publisherLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            publisherLabel.heightAnchor.constraint(equalToConstant: 20),
            
            languageLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 20),
            languageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            languageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            languageLabel.heightAnchor.constraint(equalToConstant: 20),
            
            isbn10Label.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 20),
            isbn10Label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            isbn10Label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            isbn10Label.heightAnchor.constraint(equalToConstant: 20),
            
            isbn13Label.topAnchor.constraint(equalTo: isbn10Label.bottomAnchor, constant: 20),
            isbn13Label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            isbn13Label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            isbn13Label.heightAnchor.constraint(equalToConstant: 20),
            
            pagesLabel.topAnchor.constraint(equalTo: isbn13Label.bottomAnchor, constant: 20),
            pagesLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            pagesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            pagesLabel.heightAnchor.constraint(equalToConstant: 20),
            
            yearLabel.topAnchor.constraint(equalTo: pagesLabel.bottomAnchor, constant: 20),
            yearLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            yearLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            yearLabel.heightAnchor.constraint(equalToConstant: 20),
            
            ratingLabel.topAnchor.constraint(equalTo: yearLabel.bottomAnchor, constant: 20),
            ratingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            ratingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            ratingLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20),
            descLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            descLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            
            priceLabel.topAnchor.constraint(equalTo: descLabel.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            urlLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            urlLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            urlLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            urlLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
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
