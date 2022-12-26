//
//  MovieObjectModel.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/24/22.
//

import Foundation

// movie object model for creating model objects based on results
class Movie: Decodable {
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
    
    init(backdropPath: String, overview: String, posterPath: String, title: String, id: Int) {
        self.backdropPath = backdropPath
        self.overview = overview
        self.posterPath = posterPath
        self.title = title
        self.id = id
    }    
}
