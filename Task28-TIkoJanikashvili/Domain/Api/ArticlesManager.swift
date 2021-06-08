//
//  NewsManager.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import Foundation

protocol ArticlesManagerProtocol {
    func fetchNews(completion: @escaping ([Articles]) -> Void)
}

class ArticlesManager: ArticlesManagerProtocol {
    func fetchNews(completion: @escaping ([Articles]) -> Void) {
        NetworkManager.shared.get(url: EndPoint.news.rawValue) { (result: Result<ArticlesModel,Error>) in
            switch result {
            case .success(let articles):
                completion(articles.articles)
            case .failure(let error):
                print(error)
            }
        }
    }
}
