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
                    HStack(spacing: 10) {
                        VStack {
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            Text((viewModel.movie?.imdbRating ?? "N/A") + "/10")
                        }.padding(4)
                        Image(systemName: "bookmark").font(.system(size: 24)).padding(4)
                    }
                    VStack {
                        Text("DIRECTOR: " + (viewModel.movie?.Director ?? "N/A")).padding(2)
                        Text("GENRE: " + (viewModel.movie?.Genre ?? "N/A")).padding(2)
                        Text(viewModel.movie!.Plot ?? "No Plot available for this movie").padding(10)
                    }.padding(.top, 6)
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
