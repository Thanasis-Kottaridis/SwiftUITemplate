//
//  MovieListViewModel.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 29/4/23.
//

import Foundation

fileprivate let mockMovies: [Movie] = [
    Movie(
        id: 1,
        url: "url_1",
        name: "show_1",
        type: "type_1",
        language: "language_1",
        genres: ["a","b","c"],
        image: nil,
        summary: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem."
    ),
    Movie(
        id: 2,
        url: "url_2",
        name: "show_2",
        type: "type_2",
        language: "language_2",
        genres: ["a","b","c"],
        image: nil,
        summary: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem."
    ),
    Movie(
        id: 3,
        url: "url_3",
        name: "show_3",
        type: "type_3",
        language: "language_3",
        genres: ["a","b","c"],
        image: nil,
        summary: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem."
    ),
    Movie(
        id: 4,
        url: "url_4",
        name: "show_4",
        type: "type_4",
        language: "language_4",
        genres: ["a","b","c"],
        image: nil,
        summary: "Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem."
    )
]


class MovieListViewModel: ObservableObject, BaseActionDispatcher {
    @Published var state: MovieListState
    weak var actionHandler: BaseActionHandler?
    
    init(actionHandler: BaseActionHandler?) {
        self.state = MovieListState()
        self.actionHandler = actionHandler
    }
    
    func onTriggerEvent(event: MovieListEvents) {
        switch event {
        case .fetchMovies:
            fetchMovies()
        case .goToDetails(let movie):
            actionHandler?.handleAction(action: GoToMoviesDetails(movie: movie))
        }
    }
    
    private func fetchMovies() {
        state = state.copy(moviesList: mockMovies)
    }
}
