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
                VStack {
                    Text("").searchable(text: $viewModel.searchText).onChange(of: viewModel.debouncedSearchText) { newSearchText in
                        Task {
                            await viewModel.loadMovies(s: newSearchText)
                        }
                    }
                    if viewModel.isLoading == true {
                        ProgressView()
                    } else if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).font(.system(size: 14))
                            .foregroundColor(.gray)
                    } else {
                        List(viewModel.movies, id: \.imdbID) { movie in
                            MovieListItemView(movie: movie)
                        }.frame(maxWidth: .infinity)
                            .edgesIgnoringSafeArea(.all).listStyle(PlainListStyle())
                    }
                }.navigationTitle("Search Movies")
            }
        }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView()
    }
}
