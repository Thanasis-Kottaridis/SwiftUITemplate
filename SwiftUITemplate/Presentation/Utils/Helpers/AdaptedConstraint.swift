//
//  AdaptedConstraint.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 1/5/23.
//

import UIKit

public enum Dimension {
    case width
    case height
    
    public func getReferenceDimension() -> CGFloat {
        switch self {
        case .width:
            return 411
        case .height:
            return 732 // height based on aspec retion. (UIScreen.main.bounds.height / UIScreen.main.bounds.width) * 411
        }
    }
}

public func adapted(dimensionSize: CGFloat, to dimension: Dimension) -> CGFloat {
    let screenWidth  = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var ratio: CGFloat = 0.0
    var resultDimensionSize: CGFloat = 0.0
    
    switch dimension {
    case .width:
        ratio = dimensionSize / dimension.getReferenceDimension()
        resultDimensionSize = screenWidth * ratio
    case .height:
        ratio = dimensionSize / dimension.getReferenceDimension()
        resultDimensionSize = screenHeight * ratio
    }
    
    return resultDimensionSize
}

public extension CGFloat {
    func adaptedCGFloat() -> Self {
        /// For now the only supported dimention is Portait => .width.
        let dimension: Dimension = Dimension.width
        return adapted(dimensionSize: self, to: dimension)
    }
}

public extension Int {
    func adapted() -> CGFloat {
        return CGFloat(self).adaptedCGFloat()
    }
}

