//
//  News.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import Foundation

struct Articles: Codable {
    let author: String?
    let urlToImage: String?
    let description: String?
    let publishedAt: String?
}

struct ArticlesModel:Codable {
    let articles: [Articles]
}
