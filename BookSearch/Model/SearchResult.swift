//
//  SearchResult.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import Foundation

struct SearchResult: Decodable {
    let error: String
    let total: String
    let page: String
    let books: [Book]
}
