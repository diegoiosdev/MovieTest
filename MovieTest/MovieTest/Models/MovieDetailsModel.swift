//
//  MovieDetailsModel.swift
//  MovieTest
//
//  Created by Diego Fernando on 08/01/22.
//

import Foundation

struct MovieDetailsModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [Genres]?
    let homepage: String?
    let id: Int
    let imdbId: String?
    let originalLanguage: String?
    let originalTitle: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let productionCompanies: [ProductionCompanies]?
    let productionCountries: [ProductionCountries]?
    let releaseDate: String?
    let revenue: Int?
    let runtime: Int?
    let spokenLanguages: [SpokenLanguages]?
    let status: String?
    let tagline: String?
    let title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult, budget, genres, homepage, id, overview, popularity, revenue, runtime, status, tagline, title, video
        case backdropPath = "backdrop_path"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Genres: Codable {
    let id: Int
    let name: String?
}

struct ProductionCompanies: Codable {
    let id: Int
    let logoPath: String?
    let name: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case logoPath = "logo_path"
        case originCountry = "origin_country"
        case id, name
    }
}

struct ProductionCountries: Codable {
    let iso: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso = "iso_3166_1"
        case name
    }
}

struct SpokenLanguages: Codable {
    let iso: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso = "iso_639_1"
        case name
    }
}
