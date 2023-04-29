//
//  MoviesCoordinator.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import UIKit

// MARK: - Actions
struct GoToMoviesLanding: Action {}
struct GoToMoviesDetails: Action {}

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
        self.navigationController.isNavigationBarHidden = true
        self.navigationController.navigationBar.topItem?.title = "Movies"
        
        if doStart {
            start()
        }
    }
    
    func start() {
        navigate(to: MovieListScreen(), with: .push)
    }
    
    
}

// MARK: - Handle Actions
extension MoviesCoordinator {
    public func handleAction(action: Action) {
        switch action {
        case _ as GoToMoviesLanding:
            navigate(to: MovieListScreen(), with: .push)
        case let action as GoToMoviesDetails:
            navigate(to: MovieListScreen(), with: .push)
        default:
            // Use super implementation of BaseActionHandler
            handleBaseAction(action: action)
        }
    }
}
