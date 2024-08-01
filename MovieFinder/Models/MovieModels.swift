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
    var Director: String?
    var Genre: String?
    var imdbRating: String?
    
    internal init(Title: String, Year: String, imdbID: String, `Type`: String, Poster: String, Plot: String? = nil, Director: String? = nil, Genre: String? = nil, imdbRating: String? = nil) {
        self.Title = Title
        self.Year = Year
        self.imdbID = imdbID
        self.`Type` = `Type`
        self.Poster = Poster
        self.Plot = Plot
        self.Director = Director
        self.Genre = Genre
        self.imdbRating = imdbRating
    }
    
    init(_ movie: MovieData) {
        self.Title = movie.title!
        self.Year = movie.year!
        self.imdbID = movie.imdbID!
        self.`Type` = movie.type!
        self.Poster = movie.poster!
        self.Plot = movie.plot
        self.Director = movie.director
        self.Genre = movie.genre
        self.imdbRating = movie.imdbRating
    }
}
