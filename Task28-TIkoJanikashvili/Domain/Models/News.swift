//
//  News.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import Foundation

struct News: Codable {
    let author: String?
    let urlToImage: String?
    let description: String?
}

struct Articles:Codable {
    let articles: [News]
}
