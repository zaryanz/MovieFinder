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
    @Published var isLoading = true
    @Published var errorMessage = ""
    
    init() {
        setupSearchTextDebounce()
    }

    func setupSearchTextDebounce() {
        $searchText.debounce(for: .seconds(1), scheduler: RunLoop.main)
            .assign(to: &$debouncedSearchText)
    }

    func loadMovies(s: String) async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        guard let url = URL(string: "http://www.omdbapi.com/?s=\(s)&apikey=\(apiKey)") else {
            print("API failed")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            do {
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                print(decodedResponse)
                DispatchQueue.main.async {
                    self.movies = decodedResponse.Search
                    self.isLoading = false
                }
            } catch {
                print(error)
            }
        } catch {
            print("invalid")
        }
    }
}
