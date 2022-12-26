//
//  APIService.swift
//  CSC680FinalProjectMoviesApp
//
//  Created by e on 12/24/22.
//

import Foundation

// API struct that holds URLS for requests
struct API {
    static let base_url = "https://api.themoviedb.org/3/movie/"
    static let api_key = "9d1ca8fedbebdd9ec9d692142b26b9bd"
    static let now_playing = URL(string: base_url + "now_playing?api_key=\(api_key)")!
    static let base_image_url = "http://image.tmdb.org/t/p/w185"
    static let image = URL(string: base_image_url)!
}
