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
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    func getBookLists(for bookname: String, page: Int, completed: @escaping (Result<SearchResult, BSError>) -> Void) {
        let endpoint = baseURL + "search/\(bookname)/\(page)"
        
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
                let bookList = try decoder.decode(SearchResult.self, from: data)
                completed(.success(bookList))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func getBookDetail(for isbn13: String, completed: @escaping (Result<BookDetail, BSError>) -> Void) {
        let endpoint = baseURL + "books/\(isbn13)"
        
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

                let bookDetail = try decoder.decode(BookDetail.self, from: data)
                completed(.success(bookDetail))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
