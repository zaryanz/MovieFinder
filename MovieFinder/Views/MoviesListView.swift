//
//  MoviesListView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import SwiftUI

struct MoviesListView: View {
        @StateObject private var viewModel = MoviesListViewModel()
        
        var body: some View {
            NavigationStack {
                Text("").searchable(text: $viewModel.searchText).onChange(of: viewModel.debouncedSearchText) { newSearchText in
                    Task {
                        await viewModel.loadMovies(s: newSearchText)
                    }
                }
                if !viewModel.isLoading {
                    List(viewModel.movies, id: \.imdbID) { movie in
                        HStack {
                            AsyncImage(url: URL(string: movie.Poster)
                            ) {
                                result in result.image?.resizable().scaledToFit()
                            }.frame(width: 100, height: 150)
                            Text(movie.Title)
                        }
                    }.frame( maxWidth: .infinity)
                        .edgesIgnoringSafeArea(.all).listStyle(PlainListStyle())
                } else if viewModel.isLoading {
                    ProgressView()
                } else if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                }
            }
        }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
