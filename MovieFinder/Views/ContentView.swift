//
//  ContentView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import SwiftUI

let env = ProcessInfo.processInfo.environment
let apiKey = env["API_KEY"] ?? ""

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    
    var body: some View {
        NavigationStack {
            Text("").searchable(text: $viewModel.searchText).onChange(of: viewModel.searchText) { newSearchText in
                Task {
                    await viewModel.loadMovies(s: newSearchText)
                }
            }
            if !viewModel.movies.isEmpty {
                List(viewModel.movies, id: \.imdbID) { movie in
                    HStack {
                        AsyncImage(url: URL(string: movie.Poster)
                        ) {
                            result in result.image?.resizable().scaledToFit()
                        }.frame(width: 100, height: 150)
                        Text(movie.Title)
                    }
                }
            } else {
                ProgressView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
