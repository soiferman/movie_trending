//
//  TrendingMoviesModel.swift
//  MVVM
//
//  Created by Max Soiferman on 7/2/24.
//

import Foundation

struct Response: Decodable {
    let page: Int
    let results: [MoviesModel]
    let totalPages: Int
    let totalResults: Int
}

struct MoviesModel: Codable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
}


