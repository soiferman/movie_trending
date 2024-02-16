//
//  NetworkManager.swift
//  MovieTrending
//
//  Created by Max Soiferman on 7/2/24.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://api.themoviedb.org/3/"
    static let imageURL = "https://image.tmdb.org/t/p/w500/"
    
    private let apiKey: String
    
    private init() {
        self.apiKey = "04486b1c51d618a63ff6f43db14d2f9d"
    }
    
    private var moviesURL: URL? {
        guard let url = URL(string: NetworkManager.baseURL + "movie/popular?api_key=\(apiKey)") else {
            return nil
        }
        return url
    }
    
    private var imageURL: URL? {
        guard let url = URL(string: NetworkManager.imageURL) else {
            return nil
        }
        return url
    }
    
    func getPopularMovies() async throws -> [MoviesModel] {
        guard let url = moviesURL else {
            throw MyError.invalidURL
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if let httpResponse = response as? HTTPURLResponse {
            print("Response status code:", httpResponse.statusCode)
        }
        
        // Выводим данные, полученные с сервера
        if let responseDataString = String(data: data, encoding: .utf8) {
            print("Response data:", responseDataString)
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MyError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Response.self, from: data).results
        } catch {
            print("Error decoding JSON:", error)
            throw MyError.invalidData
        }
    }
    

}

enum MyError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
