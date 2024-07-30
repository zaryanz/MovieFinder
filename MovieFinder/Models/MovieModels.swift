//
//  MovieModels.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import Foundation

struct MovieResponse: Codable {
    var Search: [Movie]
}

struct Movie: Codable {
    var Title: String
    var Year: String
    var imdbID: String
    var `Type`: String
    var Poster: String
    var Plot: String?
}
