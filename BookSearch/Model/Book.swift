//
//  Book.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import Foundation

struct Book: Decodable {
    let title: String
    let subtitle: String
    let isbn13: String
    let price: String
    let image: String
    let url: String
}
