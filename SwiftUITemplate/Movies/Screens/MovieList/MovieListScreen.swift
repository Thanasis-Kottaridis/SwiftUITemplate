//
//  ContentView.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 4/4/23.
//

import SwiftUI

struct MovieListScreen: View {
    
    @StateObject var viewModel: MovieListViewModel
    
    var body: some View {
                        
        List {
            ForEach(viewModel.state.moviesList) { item in
                MovieItem(movie: item, handler: { movie in
                    viewModel.onTriggerEvent(event: .goToDetails(movie: item))
                })
            }
        }.onAppear(perform: populateData)
    }
    
    func populateData() {
        viewModel.onTriggerEvent(event: .fetchMovies)
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        MovieListScreen(
            viewModel: MovieListViewModel(actionHandler: nil)
        )
    }
}
