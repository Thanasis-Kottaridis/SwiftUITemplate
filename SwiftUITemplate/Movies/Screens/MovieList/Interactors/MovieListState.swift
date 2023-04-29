//
//  MovieListState.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 29/4/23.
//

import Foundation

class MovieListState {
    
    // Set variables here
    let isLoading: Bool
    var isOnline: Bool
    let moviesList: [Movie]

    init(
         isLoading: Bool = false,
         isOnline: Bool = true,
         moviesList: [Movie] = []
     ) {
         self.isLoading = isLoading
         self.isOnline = isOnline
         self.moviesList = moviesList
     }
    
    func copy(
        isLoading: Bool? = nil,
        isOnline: Bool? = nil,
        moviesList: [Movie]? = nil
    ) -> MovieListState {
        return MovieListState(
            isLoading: isLoading ?? self.isLoading,
            isOnline: isOnline ?? self.isOnline,
            moviesList: moviesList ?? self.moviesList
        )
    }
    
    func baseCopy(
        isLoading: Bool?,
        isOnline: Bool?
    ) -> Self {
        return self.copy(isLoading: isLoading, isOnline: isOnline ) as! Self
    }
}
