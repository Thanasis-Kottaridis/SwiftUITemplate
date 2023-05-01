//
//  TextStyle.swift
//  Presentation
//
//  Created by thanos kottaridis on 29/1/23.
//

import Foundation
import BonMot
import SwiftUI

public struct TextStyle {
    public enum StyleWeight {
        case BLACK
        case BOLD
        case EXTRA_BOLD
        case EXTRA_LIGHT
        case LIGHT
        case REGULAR
        case SEMIBOLD
            
        func returnFont() -> Font {
            switch self {
            case .BLACK:
                return Font.MulishBlack
            case .BOLD:
                return Font.MulishBlack
            case .EXTRA_BOLD:
                return Font.MulishExtraBold
            case .EXTRA_LIGHT:
                return Font.MulishExtraLight
            case .LIGHT:
                return Font.MulishLight
            case .REGULAR:
                return Font.MulishMedium
            case .SEMIBOLD:
                return Font.MulishSemiBold
            }
        }
    }
    
    public enum Style {
        // MARK: - Figma
        case style_64_80(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_48_56(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_40_48(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_32_40(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_28_32(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_24_32(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_20_28(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_18_24(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_16_24(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_16_20(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_14_18(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_14_24(weight: StyleWeight, color: ColorPalette? = .Black)
        case style_12_16(weight: StyleWeight, color: ColorPalette? = .Black)
        case custom(
            weight: StyleWeight,
            size: Int,
            ColorPalette: CGFloat,
            lineHeight: CGFloat,
            color: ColorPalette? = .Black
        )
        
        public func stringStyle() -> BonMot.StringStyle {
            switch self {
            case .style_64_80(let weight, let color):
                return getStyle(weight: weight,
                                size: 64,
                                letterSpacing: 0.02,
                                lineHeight: 80.0,
                                color: color
                        )
            case .style_48_56(let weight, let color):
                return getStyle(weight: weight, size: 48,
                                letterSpacing: 0,
                                lineHeight: 56.0,
                                color: color
                        )
            case .style_40_48(let weight, let color):
                return getStyle(weight: weight, size: 40,
                                letterSpacing: 0,
                                lineHeight: 48.0,
                                color: color
                        )
            case .style_32_40(let weight, let color):
                return getStyle(weight: weight, size: 32,
                                letterSpacing: 0.02,
                                lineHeight: 40.0,
                                color: color
                        )
            case .style_28_32(let weight, let color):
                return getStyle(weight: weight, size: 28,
                                letterSpacing: 0.02,
                                lineHeight: 32.0,
                                color: color
                        )
            case .style_24_32(let weight, let color):
                return getStyle(weight: weight, size: 24,
                                letterSpacing: 0.02,
                                lineHeight: 32.0,
                                color: color
                        )
            case .style_20_28(let weight, let color):
                return getStyle(weight: weight, size: 20,
                                letterSpacing: 0.02,
                                lineHeight: 28.0,
                                color: color
                        )
            case .style_18_24(let weight, let color):
                return getStyle(weight: weight, size: 18,
                                letterSpacing: 0,
                                lineHeight: 24.0,
                                color: color
                        )
            case .style_16_24(let weight, let color):
                return getStyle(weight: weight, size: 16,
                                letterSpacing: 0.01,
                                lineHeight: 24.0,
                                color: color
                        )
            case .style_16_20(let weight, let color):
                return getStyle(weight: weight, size: 16,
                                letterSpacing: 0.01,
                                lineHeight: 20.0,
                                color: color
                        )
            case .style_14_18(let weight, let color):
                return getStyle(weight: weight, size: 14,
                                letterSpacing: 0.02,
                                lineHeight: 18.0,
                                color: color
                        )
            case .style_14_24(let weight, let color):
                return getStyle(weight: weight, size: 14,
                                letterSpacing: 0,
                                lineHeight: 24.0,
                                color: color
                
                        )
            case .style_12_16(let weight, let color):
                return getStyle(weight: weight, size: 12,
                                letterSpacing: 0.01,
                                lineHeight: 16.0,
                                color: color
                        )
            case .custom(let weight, let size, let letterSpacing, let lineHeight, let color):
                return getStyle(weight: weight, size: size,
                                letterSpacing: letterSpacing,
                                lineHeight: lineHeight,
                                color: color
                        )
            }
        }

    }
    
    public static func getStyle(
        weight: StyleWeight, size: Int,
        letterSpacing: CGFloat,
        lineHeight: CGFloat,
        color: ColorPalette? = .Black
    ) -> BonMot.StringStyle {
        if let color = color {
            return StringStyle(
                .color(color.uiKitValue),
                .font(weight.returnFont().of(size: size.getAdjustedFontSize())),
                .extraAttributes([NSAttributedString.Key.kern: CGFloat(size) * letterSpacing])
            )
        } else {
            return StringStyle(
                .font(weight.returnFont().of(size: size.getAdjustedFontSize())),
                .extraAttributes([NSAttributedString.Key.kern: CGFloat(size) * letterSpacing])
            )
        }
    }
}

// MARK: TextStyle.Style Attributes EXT
public extension TextStyle.Style {
    
    var weight: TextStyle.StyleWeight {
        switch self {
        case let .style_64_80(weight, _),
            let .style_48_56(weight, _),
            let .style_40_48(weight, _),
            let .style_32_40(weight, _),
            let .style_28_32(weight, _),
            let .style_24_32(weight, _),
            let .style_20_28(weight, _),
            let .style_18_24(weight, _),
            let .style_16_24(weight, _),
            let .style_16_20(weight, _),
            let .style_14_18(weight, _),
            let .style_14_24(weight, _),
            let .style_12_16(weight, _),
            let .custom(weight, _, _, _, _):
            return weight
        }
    }
    
    var color: ColorPalette? {
        switch self {
        case let .style_64_80(_, color),
            let .style_48_56(_, color),
            let .style_40_48(_, color),
            let .style_32_40(_, color),
            let .style_28_32(_, color),
            let .style_24_32(_, color),
            let .style_20_28(_, color),
            let .style_18_24(_, color),
            let .style_16_24(_, color),
            let .style_16_20(_, color),
            let .style_14_18(_, color),
            let .style_14_24(_, color),
            let .style_12_16(_, color),
            let .custom(_, _, _, _, color):
            return color
        }
    }
    
    var adaptedSize: CGFloat {
        switch self {
        case .style_64_80: return 64.getAdjustedFontSize()
        case .style_48_56: return 48.getAdjustedFontSize()
        case .style_40_48: return 40.getAdjustedFontSize()
        case .style_32_40: return 32.getAdjustedFontSize()
        case .style_28_32: return 28.getAdjustedFontSize()
        case .style_24_32: return 24.getAdjustedFontSize()
        case .style_20_28: return 20.getAdjustedFontSize()
        case .style_18_24: return 18.getAdjustedFontSize()
        case .style_16_24: return 16.getAdjustedFontSize()
        case .style_16_20: return 16.getAdjustedFontSize()
        case .style_14_18: return 14.getAdjustedFontSize()
        case .style_14_24: return 14.getAdjustedFontSize()
        case .style_12_16: return 12.getAdjustedFontSize()
        case .custom(_, let size, _, _, _): return CGFloat(size)
        }
    }
    
    var letterSpacing: CGFloat {
        switch self {
        case .style_64_80: return CGFloat(0.02)
        case .style_48_56: return CGFloat(0)
        case .style_40_48: return CGFloat(0)
        case .style_32_40: return CGFloat(0.02)
        case .style_28_32: return CGFloat(0.02)
        case .style_24_32: return CGFloat(0.02)
        case .style_20_28: return CGFloat(0.02)
        case .style_18_24: return CGFloat(0)
        case .style_16_24: return CGFloat(0.01)
        case .style_16_20: return CGFloat(0.01)
        case .style_14_18: return CGFloat(0.02)
        case .style_14_24: return CGFloat(0)
        case .style_12_16: return CGFloat(0.01)
        case .custom(_, _,  let letterSpacing, _, _): return letterSpacing
        }
    }
    
    var lineHeight: CGFloat {
        switch self {
        case .style_64_80: return CGFloat(80)
        case .style_48_56: return CGFloat(56)
        case .style_40_48: return CGFloat(48)
        case .style_32_40: return CGFloat(40)
        case .style_28_32: return CGFloat(32)
        case .style_24_32: return CGFloat(32)
        case .style_20_28: return CGFloat(28)
        case .style_18_24: return CGFloat(24)
        case .style_16_24: return CGFloat(24)
        case .style_16_20: return CGFloat(20)
        case .style_14_18: return CGFloat(18)
        case .style_14_24: return CGFloat(24)
        case .style_12_16: return CGFloat(16)
        case .custom(_, _, _, let lineHeight, _): return lineHeight
        }
    }

}

// MARK: - EXTENSIONS
public extension String {
    /**
    # Attributed Text Style util.
     Use .with method in order to get preferable  `TextStyle.Style` attributed text
     */
    func with(_ style: TextStyle.Style) -> NSAttributedString {
        return self.styled(with: style.stringStyle())
    }
}

public extension Int {
    
    /**
    # Adapted Font Size.
     Get dynamicly addapted font size based on figma width regerence
     */
    func getAdjustedFontSize() -> CGFloat {
        // Figma project is created for Pixel 2 with screen width of 411 pixels
        let projectSize: CGFloat = 411
        let currentSize: CGFloat = UIScreen.main.bounds.width
        
        // With the Rule of Three we can calculate the font size for the current device
        let finalFontSize: CGFloat = (currentSize * CGFloat(self)) / projectSize
        
        return finalFontSize
    }
}

// MARK: SwiftUI Font Modifier
struct CustomTextStyle: ViewModifier {
    var style: TextStyle.Style
    
    func body(content: Content) -> some View {
        let uiKitFont = style.weight.returnFont().of(size: style.adaptedSize)
        let lineSpacing = style.lineHeight - uiKitFont.lineHeight
        content
            .font(.custom(style.weight.returnFont().rawValue, size: style.adaptedSize))
            .foregroundColor(style.color?.value)
            .lineSpacing(lineSpacing)
//            .tracking(style.letterSpacing)
    }
}
