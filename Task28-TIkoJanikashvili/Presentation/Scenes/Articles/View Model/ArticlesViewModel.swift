//
//  ArticlesViewModel.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import Foundation

struct ArticlesViewModel {
    
    // MARK: - Private Properties
    private var articles: Articles
    
    init(with articles: Articles) {
        self.articles = articles
    }
    
    var author: String {
        articles.author ?? ""
    }
    
    var imageURL: URL? {
        URL(string: articles.urlToImage ?? "")
    }
    
    var description: String {
        articles.description ?? ""
    }
    
    var time: String {
        self.getTime(at : articles.publishedAt ?? "")
    }
    
    private func getTime(at df: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let dataformater = dateFormatter.date(from: df) {
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.dateFormat = "HH:mm"
            let dateString = dateFormatter.string(from: dataformater)
            return dateString
        } else {
            return ""
        }
    }
}


