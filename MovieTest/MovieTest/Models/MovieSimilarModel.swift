//
//  MovieSimilarModel.swift
//  MovieTest
//
//  Created by Diego Fernando on 08/01/22.
//

import Foundation

struct MovieSimilarModel: Codable {
    let results: [Results]?
}

struct Results: Codable {
    let backdropPath: String?
    let id: Int
    let title: String?
    let originalTitle: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    
    enum CodingKeys: String, CodingKey {
        case id, popularity, title
        case backdropPath = "backdrop_path"
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
    }
}
