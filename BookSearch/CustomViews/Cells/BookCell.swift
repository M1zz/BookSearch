//
//  BookCell.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class BookCell: UITableViewCell {

    static let reuseID = "BookCell"
    
    let thumnailImageView = BSThumbnailImageView(frame: .zero)
    let titleLabel = BSTitleLabel(textAlignment: .center, fontSize: 20)
    let subtitleLabel = BSBodyLabel(textAlignment: .center)
    let isbn13Label = BSBodyLabel(textAlignment: .center)
    let priceLabel = BSBodyLabel(textAlignment: .center)
    let urlLabel = BSBodyLabel(textAlignment: .center)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        thumnailImageView.image = nil
    }
    
    func set(book: Book) {
        thumnailImageView.downloadThumbnailImage(fromURL: book.image)
        titleLabel.text = book.title
        subtitleLabel.text = book.subtitle
        isbn13Label.text = book.isbn13
        priceLabel.text = book.price
        urlLabel.text = book.url
    }
    
    
    private func configure() {
        addSubview(thumnailImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(isbn13Label)
        addSubview(priceLabel)
        addSubview(urlLabel)
        
        let padding: CGFloat = 20
        
        NSLayoutConstraint.activate([
            thumnailImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            thumnailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            thumnailImageView.heightAnchor.constraint(equalToConstant: 140),
            thumnailImageView.widthAnchor.constraint(equalToConstant: 120),
            
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            subtitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            isbn13Label.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: 20),
            isbn13Label.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            isbn13Label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            isbn13Label.heightAnchor.constraint(equalToConstant: 20),
            
            priceLabel.topAnchor.constraint(equalTo: isbn13Label.topAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            priceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            urlLabel.topAnchor.constraint(equalTo: priceLabel.topAnchor, constant: 20),
            urlLabel.leadingAnchor.constraint(equalTo: thumnailImageView.trailingAnchor, constant: 24),
            urlLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
            urlLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
