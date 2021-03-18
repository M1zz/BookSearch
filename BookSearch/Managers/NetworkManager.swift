//
//  NetworkManager.swift
//  BookSearch
//
//  Created by 이현호 on 2021/03/18.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    let baseURL = "https://api.itbook.store/1.0/"
    // search https://api.itbook.store/1.0/search/{query}/{page}
    // detail https://api.itbook.store/1.0/books/{isbn13}
    
    private init() {}
    
    func getBookLists(for bookname: String, page: Int, completed: @escaping (Result<[Book], BSError>) -> Void) {
        let endpoint = baseURL + "search/\(bookname)"
        
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidBookname))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                //decoder.keyDecodingStrategy = .convertFromSnakeCase
                let bookList = try decoder.decode(SearchResult.self, from: data)
                completed(.success(bookList.books))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
