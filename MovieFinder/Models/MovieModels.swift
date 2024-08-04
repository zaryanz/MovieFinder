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

struct MovieNotFoundResponse: Codable {
    var Response: String
    var Error: String
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
    var ID: String?
    
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
    
    /// Create a Movie entity from MovieData
    /// - Parameters:
    ///     - movie: MovieInDB present in CoreData DB
    init(_ movieData: MovieInDB) {
        self.Title = movieData.title!
        self.Year = movieData.year!
        self.imdbID = movieData.imdbID!
        self.`Type` = movieData.type!
        self.Poster = movieData.poster!
        self.Plot = movieData.plot
        self.Director = movieData.director
        self.Genre = movieData.genre
        self.imdbRating = movieData.imdbRating
    }
}
