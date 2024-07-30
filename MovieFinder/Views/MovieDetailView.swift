//
//  MovieDetailView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 30/07/24.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel = MovieDetailViewModel()
    
    let imdbID: String
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                VStack {
                    AsyncImage(url: URL(string: viewModel.movie!.Poster)
                    ) {
                        result in result.image?.resizable().scaledToFit()
                    }.frame(width: 200, height: 300)
                    Text(viewModel.movie!.Title).font(.title)
                    Text(viewModel.movie!.Year)
                    Text(viewModel.movie!.Plot ?? "No Plot available for this movie")
                    Text("Director: \(viewModel.movie!.Director)")
                    Text("Genre: \(viewModel.movie!.Genre)")
                }
                Spacer()
            }
        }.navigationTitle(viewModel.isLoading ? "" :viewModel.movie!.Title +  " (" + viewModel.movie!.Year + ")" )
            .navigationBarTitleDisplayMode(.inline).task {
            await viewModel.loadMovie(imdbID: imdbID)
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbID: "tt2005374")
    }
}
