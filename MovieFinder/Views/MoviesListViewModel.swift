//
//  ViewModel.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import Foundation

final class MoviesListViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var debouncedSearchText = ""
    @Published var movies = [Movie]()
    @Published var isLoading = false
    @Published var errorMessage = "Start typing at least 3 letters to search for a movie"
    
    init() {
        setupSearchTextDebounce()
    }

    func setupSearchTextDebounce() {
        $searchText.debounce(for: .seconds(1), scheduler: RunLoop.main)
            .assign(to: &$debouncedSearchText)
    }

    func loadMovies(s: String) async {
        if(s.count < 3) {
            print("Count < 3")
            DispatchQueue.main.async {
                self.movies = []
                self.isLoading = false
            }
            return
        }
        DispatchQueue.main.async {
            self.isLoading = true
        }
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(s)&apikey=\(apiKey)") else {
            errorMessage = "Error connecting to the API"
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                print(decodedResponse)
                DispatchQueue.main.async {
                    self.movies = decodedResponse.Search
                    self.isLoading = false
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
