//
//  WatchlistView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 01/08/24.
//

import SwiftUI

struct WatchlistView: View {
    @StateObject private var viewModel = WatchlistViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                List(viewModel.moviesInWatchlist, id: \.imdbID) { movie in
                    MovieListItemView(movie: movie)
                }.frame(maxWidth: .infinity).edgesIgnoringSafeArea(.all).listStyle(PlainListStyle())
                    .navigationTitle("My Watchlist")
                    .onAppear {
                        viewModel.getMoviesInWatchlist()
                    }
            }
        }
    }
    
}

struct WatchlistView_Previews: PreviewProvider {
    static var previews: some View {
        WatchlistView()
    }
}
