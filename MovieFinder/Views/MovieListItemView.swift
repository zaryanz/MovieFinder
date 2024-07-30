//
//  MovieListItemView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 30/07/24.
//

import SwiftUI

struct MovieListItemView: View {
    let movie: Movie
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(imdbID: movie.imdbID)) {
            HStack {
                AsyncImage(url: URL(string: movie.Poster)
                ) {
                    result in result.image?.resizable().scaledToFit()
                }.frame(width: 100, height: 150)
                VStack(alignment: .leading) {
                    Text("\(movie.Title) (\(movie.Year))")
                    Text(movie.Type.capitalized)
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct MovieListItemView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListItemView(movie: Movie(Title: "Curb Your Enthusiasm", Year: "2000–2024", imdbID: "tt0264235", Type: "series", Poster: "https://m.media-amazon.com/images/M/MV5BZDY1ZGM4OGItMWMyNS00MDAyLWE2Y2MtZTFhMTU0MGI5ZDFlXkEyXkFqcGdeQXVyMDc5ODIzMw@@._V1_SX300.jpg"))
    }
}
