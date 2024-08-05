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
                self.errorMessage = "Start typing at least 3 letters to search for a movie"
            }
            return
        }
        DispatchQueue.main.async {
            self.isLoading = true
        }
        // processing the string to meet api input requirements
        let searchQuery = s.replacingOccurrences(of: " ", with: "+")
        guard let url = URL(string: "\(baseUrl)?s=\(searchQuery)&apikey=\(apiKey)") else {
            DispatchQueue.main.async {
                self.errorMessage = "Error connecting to the API"
            }
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            do {
                if let decodedResponse = try? JSONDecoder().decode(MovieResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.movies = decodedResponse.Search
                        self.isLoading = false
                        self.errorMessage = ""
                    }
                } else {
                    let _ = try JSONDecoder().decode(MovieNotFoundResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.isLoading = false
                        self.errorMessage = "No results found"
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "Error connecting to the API"
                }
            }
        } catch {
            print("invalid")
        }
    }
}
