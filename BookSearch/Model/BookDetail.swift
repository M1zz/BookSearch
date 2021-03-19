//
//  BookDetail.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import Foundation

struct BookDetail: Decodable {
    let error: String
    let title: String
    let subtitle: String
    let authors: String
    let publisher: String
    let language: String
    let isbn10: String
    let isbn13: String
    let pages: String
    let year: String
    let rating: String
    let desc: String
    let price: String
    let image: String
    let url: String
}
