//
//  ArticlesListViewModels.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import Foundation

protocol ArticlesListViewModelProtocol {
    func getArticlesList(completion: @escaping ([ArticlesViewModel]) -> Void)
    init(with articlesManager: ArticlesManagerProtocol)
}

class ArticlesListViewModel: ArticlesListViewModelProtocol {
   
    // MARK: - Private Properties
    private var articlesManager: ArticlesManagerProtocol!
    
    required init(with articlesManager: ArticlesManagerProtocol) {
        self.articlesManager = articlesManager
    }
    
    func getArticlesList(completion: @escaping ([ArticlesViewModel]) -> Void) {
        self.articlesManager.fetchNews { articles in
            completion(articles.map{ArticlesViewModel(with: $0)})
        }
    }
}
