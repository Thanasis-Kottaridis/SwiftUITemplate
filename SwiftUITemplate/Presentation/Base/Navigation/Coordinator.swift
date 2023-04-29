//
//  Coordinator.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import Foundation
import UIKit
import SwiftUI

public enum NavigationStyle {
    case present
    case push
    case resetStack
    case bottomSheet
    case overCurrentContext
    case overFullScreen
    case pop
    case reversePush
    case fade
}

public protocol Coordinator: AnyObject, ObservableObject {
    var navigationController: UINavigationController { get set }
    
    func start()
}

// MARK: - Navigation EXT
extension Coordinator {

    public func navigate(
        to view: some View,
        with navigationStyle: NavigationStyle,
        animated: Bool = true,
        resetingStack: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        
        let viewWithCoordinator = view.environmentObject(self)
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        navigate(
            to: viewController,
            with: navigationStyle,
            animated: animated,
            resetingStack: resetingStack,
            completion: completion
        )
       
    }
    
    
    public func navigate(
        to viewController: UIViewController,
        with navigationStyle: NavigationStyle,
        animated: Bool = true,
        resetingStack: Bool = false,
        completion: (() -> Void)? = nil
    ) {
        switch navigationStyle {
        case .push:
            navigationController.pushViewController(viewController, animated: animated)
        case .present:
            viewController.modalPresentationStyle = .fullScreen
            viewController.definesPresentationContext = true
            navigationController.present(viewController, animated: animated, completion: completion)
        case .resetStack:
            break
        case .bottomSheet:
            break
        case .overCurrentContext:
            viewController.modalPresentationStyle = .overCurrentContext
            navigationController.present(viewController, animated: animated, completion: completion)
        case .overFullScreen:
            viewController.modalPresentationStyle = .overFullScreen
            navigationController.present(viewController, animated: animated, completion: completion)
        case .pop:
            navigationController.popViewController(animated: animated)
        case .reversePush:
            navigationController.addTransition()
            navigationController.pushViewController(viewController, animated: false)
        case .fade:
            navigationController.addTransition(transitionType: .fade)
            navigationController.pushViewController(viewController, animated: false)
        }    }
}
