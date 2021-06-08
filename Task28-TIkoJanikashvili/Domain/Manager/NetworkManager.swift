//
//  NetworkManager.swift
//  Task28-TIkoJanikashvili
//
//  Created by Tiko on 08.06.21.
//

import Foundation

enum EndPoint: String {
    case news = "https://newsapi.org/v2/everything?q=tesla&from=2021-05-08&sortBy=publishedAt&apiKey=7bae2a92b3e84d52b69b466653a27be9"
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func get<T: Codable>(url: String, completion: @escaping ((Result<T, Error>) -> Void)) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
            guard let data = data else { return }
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
