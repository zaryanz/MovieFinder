//
//  MovieDetailView.swift
//  MovieFinder
//
//  Created by Aryan Singh on 30/07/24.
//

import SwiftUI

struct MovieDetailView: View {
    let imdbID: String
    
    var body: some View {
        Text(imdbID)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(imdbID: "tt2005374")
    }
}
