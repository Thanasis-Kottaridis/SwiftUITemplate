//
//  UINavigationController_Ext.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 25/4/23.
//

import UIKit

extension UINavigationController {
    
    public func addTransition(
        transitionType type: CATransitionType = .push,
        duration: CFTimeInterval = 0.5
    ) {
        let transition = CATransition()
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType(rawValue: type.rawValue)
        self.view.layer.add(transition, forKey: nil)
    }
}
