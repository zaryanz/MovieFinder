//
//  MovieDetailViewModel.swift
//  MovieFinder
//
//  Created by Aryan Singh on 30/07/24.
//

import Foundation

final class MovieDetailViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var errorMessage = ""
    @Published var movie: Movie?
    
    func loadMovie(imdbID: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
            self.errorMessage = ""
        }
        
        guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbID)&apikey=\(apiKey)") else {
            errorMessage = "Error connecting to the API"
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decodedResponse = try JSONDecoder().decode(Movie.self, from: data)
                print(decodedResponse)
                DispatchQueue.main.async {
                    self.movie = decodedResponse
                    self.isLoading = false
                    self.errorMessage = ""
                }
            } catch {
                print(error)
                DispatchQueue.main.async {
                    self.errorMessage = "Error connecting to the API"
                }
            }
        } catch {
            print("invalid")
        }
    }
}
