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

/**
 {
    "error":"0",
    "title":"Architecture Patterns with Python",
    "subtitle":"Enabling Test-Driven Development, Domain-Driven Design, and Event-Driven Microservices",
    "authors":"Harry Percival, Bob Gregory",
    "publisher":"O'Reilly Media",
    "language":"English",
    "isbn10":"1492052205",
    "isbn13":"9781492052203",
    "pages":"304",
    "year":"2020",
    "rating":"4",
    "desc":"As Python continues to grow in popularity, projects are becoming larger and more complex. Many Python developers are taking an interest in high-level software design patterns such as hexagonal/clean architecture, event-driven architecture, and the strategic patterns prescribed by domain-driven desig...",
    "price":"$34.49",
    "image":"https://itbook.store/img/books/9781492052203.png",
    "url":"https://itbook.store/books/9781492052203"
 }
 */
