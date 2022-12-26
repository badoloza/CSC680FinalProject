//
//  MovieJSONModel.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/24/22.
//

import Foundation

// structs that represent the JSON data we want
// used json quicktype app to build structs accurately
struct MovieModel: Decodable {
    let dates: Dates
    let page: Int
    let results: [Result]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Decodable {
    let maximum, minimum: String
}

// MARK: - Result
struct Result: Decodable {
    let backdropPath: String
    let overview: String
    let posterPath, title: String
    let id: Int

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case overview
        case posterPath = "poster_path"
        case title
        case id
    }
    
}
