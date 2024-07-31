//
//  ContentView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 29/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MoviesListView().tabItem {
                Label("Home", systemImage: "house.fill")
            }
            MovieDetailView(imdbID: "tt2005374").tabItem {
                Label("Watchlist", systemImage: "bookmark.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
