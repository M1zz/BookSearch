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


/**
 {
    "title":"Architecture Patterns with Python",
    "subtitle":"Enabling Test-Driven Development, Domain-Driven Design, and Event-Driven Microservices",
    "isbn13":"9781492052203",
    "price":"$34.49",
    "image":"https://itbook.store/img/books/9781492052203.png",
    "url":"https://itbook.store/books/9781492052203"
 }
 */
