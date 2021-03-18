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

/*
 {
    "error":"0",
    "total":"8",
    "page":"1",
    "books":[
       {
          "title":"Architecture Patterns with Python",
          "subtitle":"Enabling Test-Driven Development, Domain-Driven Design, and Event-Driven Microservices",
          "isbn13":"9781492052203",
          "price":"$34.49",
          "image":"https://itbook.store/img/books/9781492052203.png",
          "url":"https://itbook.store/books/9781492052203"
       },
       {
          "title":"The PHP Anthology, Volume 2",
          "subtitle":"Object Oriented PHP Solutions",
          "isbn13":"9780957921849",
          "price":"$3.98",
          "image":"https://itbook.store/img/books/9780957921849.png",
          "url":"https://itbook.store/books/9780957921849"
       },
       {
          "title":"The PHP Anthology, Volume 1",
          "subtitle":"Object Oriented PHP Solutions",
          "isbn13":"9780957921856",
          "price":"$3.01",
          "image":"https://itbook.store/img/books/9780957921856.png",
          "url":"https://itbook.store/books/9780957921856"
       },
       {
          "title":"Coding Interviews",
          "subtitle":"Questions, Analysis & Solutions",
          "isbn13":"9781430247616",
          "price":"$18.65",
          "image":"https://itbook.store/img/books/9781430247616.png",
          "url":"https://itbook.store/books/9781430247616"
       },
       {
          "title":"Juniper MX Series",
          "subtitle":"A Comprehensive Guide to Trio Technologies on the MX",
          "isbn13":"9781449319717",
          "price":"$6.83",
          "image":"https://itbook.store/img/books/9781449319717.png",
          "url":"https://itbook.store/books/9781449319717"
       },
       {
          "title":"Test-Driven Development with Python",
          "subtitle":"Obey the Testing Goat: Using Django, Selenium, and JavaScript",
          "isbn13":"9781449364823",
          "price":"$12.17",
          "image":"https://itbook.store/img/books/9781449364823.png",
          "url":"https://itbook.store/books/9781449364823"
       },
       {
          "title":"Junos Enterprise Routing, 2nd Edition",
          "subtitle":"A Practical Guide to Junos Routing and Certification",
          "isbn13":"9781449398637",
          "price":"$54.99",
          "image":"https://itbook.store/img/books/9781449398637.png",
          "url":"https://itbook.store/books/9781449398637"
       },
       {
          "title":"Test-Driven Development with Python, 2nd Edition",
          "subtitle":"Obey the Testing Goat: Using Django, Selenium, and JavaScript",
          "isbn13":"9781491958704",
          "price":"$51.87",
          "image":"https://itbook.store/img/books/9781491958704.png",
          "url":"https://itbook.store/books/9781491958704"
       }
    ]
 }
 */
