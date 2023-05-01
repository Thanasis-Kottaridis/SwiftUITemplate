//
//  ColorPallet.swift
//  SwiftUITemplate
//
//  Created by thanos kottaridis on 30/4/23.
//

import SwiftUI

public indirect enum ColorPalette {
    case DarkBlue
    case RegularBlue
    case LightBlue
    case Black
    case White
    case DarkGray
    case Gray
    case Green
    case Red
    case CustomAlpha(color: ColorPalette ,alpha: Double)
    
    public func withAlpha(_ alpha: Double) -> Color {
        return self.value.opacity(alpha)
    }
    
    public func withAlpha(_ alpha: Double) -> UIColor {
        return self.uiKitValue.withAlphaComponent(CGFloat(alpha))
    }
}

public extension ColorPalette {
    var uiKitValue: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
        case .DarkBlue:
            instanceColor = UIColor(hexString:"#00265E")
        case .RegularBlue:
            instanceColor = UIColor(hexString: "#003476")
        case .LightBlue:
            instanceColor = UIColor(hexString: "#00AEEF")
        case .Black:
            instanceColor = UIColor(hexString: "#212529")
        case .White:
            instanceColor = UIColor(hexString: "#FFFFFF")
        case .Gray:
            instanceColor = UIColor(hexString: "#F4F4F4")
        case .DarkGray:
            instanceColor = UIColor(hexString: "#2C2C2E")
        case .Green:
            instanceColor = UIColor(hexString: "#80C479")
        case .Red:
            instanceColor = UIColor(hexString: "#C4324A")
        case .CustomAlpha(let color, let alpha):
            instanceColor = color.withAlpha(alpha)
        }
        
        return instanceColor

    }
    
    var value: Color {
        var instanceColor = Color.clear
        
        switch self {
        case .DarkBlue:
            instanceColor = Color(hexString:"#00265E")
        case .RegularBlue:
            instanceColor = Color(hexString: "#003476")
        case .LightBlue:
            instanceColor = Color(hexString: "#00AEEF")
        case .Black:
            instanceColor = Color(hexString: "#212529")
        case .White:
            instanceColor = Color(hexString: "#FFFFFF")
        case .Gray:
            instanceColor = Color(hexString: "#F4F4F4")
        case .DarkGray:
            instanceColor = Color(hexString: "#2C2C2E")
        case .Green:
            instanceColor = Color(hexString: "#80C479")
        case .Red:
            instanceColor = Color(hexString: "#C4324A")
        case .CustomAlpha(let color, let alpha):
            instanceColor = color.withAlpha(alpha)
        }
        
        return instanceColor

    }
}

extension Color {
    init(hexString hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

public extension UIColor {
    convenience init(hexString: String) {

        let hexString: String = (hexString as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)

        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)

        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask

        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}
