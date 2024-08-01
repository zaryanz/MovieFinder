//
//  WatchlistViewModel.swift
//  MovieFinder
//
//  Created by Aryan Singh on 31/07/24.
//

import Foundation
import CoreData

final class WatchlistViewModel: ObservableObject {
    
    @Published var moviesInWatchlist = [Movie]()
    
    func getMoviesInWatchlist() {
        let data = CoreDataManager.shared.getData()
        moviesInWatchlist = data
    }
}
