//
//  MoviesCoordinator.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import UIKit

class MoviesCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    
    init() {
        navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        navigationController.navigationBar.topItem?.title = "Movies"
        start()
    }
    
    func start() {
        navigate(to: MovieListScreen(), with: .push)
    }
    
    
}
