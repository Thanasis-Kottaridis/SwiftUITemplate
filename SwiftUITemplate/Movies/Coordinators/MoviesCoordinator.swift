//
//  MoviesCoordinator.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import UIKit

// MARK: - Actions
struct GoToMoviesLanding: Action {}
struct GoToMoviesDetails: Action { let movie: Movie }

class MoviesCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    var childCoordinators = [CoordinatorKey : any Coordinator]()
    var coordinatorKey: CoordinatorKey = .movieCoordinator
    var navigationController: UINavigationController
    
    public init(
        navigationController: UINavigationController? = nil,
        parentCoordinator: (any Coordinator),
        doStart: Bool = true
    ) {
        self.navigationController = UINavigationController()
        self.navigationController.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationController.isNavigationBarHidden = false
        self.navigationController.navigationBar.prefersLargeTitles = true
        
        if doStart {
            start()
        }
    }
    
    func start() {
        handleAction(action: GoToMoviesLanding())
    }
}

// MARK: - Handle Actions
extension MoviesCoordinator {
    public func handleAction(action: Action) {
        switch action {
        case _ as GoToMoviesLanding:
            let viewModel = MovieListViewModel(actionHandler: self)
            let screen = MovieListScreen(viewModel: viewModel)
            navigate(to: screen, with: .push, andTitle: "Movies")
        case let action as GoToMoviesDetails:
            navigate(
                to: MovieDetailsScreen(movie: action.movie),
                with: .push,
                andTitle: action.movie.name ?? "Details"
            )
        default:
            // Use super implementation of BaseActionHandler
            handleBaseAction(action: action)
        }
    }
}
