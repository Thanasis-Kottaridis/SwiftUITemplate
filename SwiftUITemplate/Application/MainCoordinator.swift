//
//  MainCoordinator.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import UIKit
import SwiftUI

class MainCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init() {
        self.navigationController = UINavigationController()
        self.navigationController.isNavigationBarHidden = true
        start()
    }
    
    
    func start() {
        let moviesCoord = MoviesCoordinator()
        navigate(to: moviesCoord.navigationController, with: .present)
    }
}
