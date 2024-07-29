//
//  ViewModel.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import Foundation

final class ViewModel: ObservableObject {
    @Published var movies = [Movie]()
    
    func loadMovies(s: String) async {
        print(s)
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
                movies = decodedResponse.Search
            } catch {
                print(error)
            }
        } catch {
            print("invalid")
        }
    }
}
