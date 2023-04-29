//
//  MainCoordinator.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import UIKit
import SwiftUI

struct GoToMovies: Action {}

class MainCoordinator: Coordinator {
    var parentCoordinator: (any Coordinator)?
    var childCoordinators = [CoordinatorKey : any Coordinator]()
    var coordinatorKey: CoordinatorKey = .mainCoordinator
    var navigationController: UINavigationController
    
    init() {
        self.parentCoordinator = nil
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        start()
    }
    
    
    func start() {
        handleAction(action: GoToMovies())
    }
}

// MARK: Handle Action
extension MainCoordinator {
    func handleAction(action: Action) {
        switch action {
        case _ as GoToMovies:
            let moviesCoord = MoviesCoordinator(parentCoordinator: self)
            addChild(coordinator: moviesCoord, with: .movieCoordinator)
            navigate(to: moviesCoord.navigationController, with: .present)
        default:
            handleBaseAction(action: action)
        }
    }
}
