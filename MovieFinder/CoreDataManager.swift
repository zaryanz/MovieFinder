//
//  CoreDataManager.swift
//  MovieFinder
//
//  Created by Aryan Singh on 01/08/24.
//

import Foundation
import CoreData

class CoreDataManager {
    let container: NSPersistentContainer
    static let shared = CoreDataManager()
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    @Published var savedData: [MovieInDB] = []
    
    private init() {
        container = NSPersistentContainer(name: "Watchlist")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            } else {
                print("Core Data loaded")
            }
        }
    }
    
    func getMoviesInDB() -> [Movie] {
        let request = NSFetchRequest<MovieInDB>(entityName: "MovieInDB")
        
        do {
            try savedData = container.viewContext.fetch(request)
            let data = savedData.map { Movie.init($0) }
            return data
        } catch {
            print("Error getting data: \(error.localizedDescription)")
            return [Movie]()
        }
    }
    
    private func getMovieInDBByImdbID(imdbID: String) -> MovieInDB? {
        let request = NSFetchRequest<MovieInDB>(entityName: "MovieInDB")
        
        let predicate = NSPredicate(format: "imdbID == %@", imdbID)
        request.predicate = predicate
        
        do {
            let data = try container.viewContext.fetch(request)
            print(data)
            return (data.first != nil ? data.first! : nil)
        } catch {
            print("Error getting data: \(error.localizedDescription)")
            return nil
        }
    }
    
    func addMovieToDB(movie: Movie) {
        let movieData = MovieInDB(context: container.viewContext)
        movieData.title = movie.Title
        movieData.type = movie.`Type`
        movieData.year = movie.Year
        movieData.poster = movie.Poster
        movieData.plot = movie.Plot
        movieData.imdbID = movie.imdbID
        movieData.imdbRating = movie.imdbRating
        movieData.genre = movie.Genre
        movieData.director = movie.Director
        saveDataInDB()
    }
    
    func deleteMovieFromDB(movie: Movie) {
        let data = getMovieInDBByImdbID(imdbID: movie.imdbID)
        if data != nil {
            viewContext.delete(data!)
            saveDataInDB()
        }
    }
    
    func saveDataInDB() {
        do {
            try container.viewContext.save()
            getMoviesInDB()
        } catch let error {
            print("Error: \(error)")
        }
    }
}
