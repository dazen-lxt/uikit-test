//
//  UIColor+Extensions.swift .swift
//  RickMortyUIKit
//
//  Created by Carlos Mario Muñoz on 18/10/23.
//

import UIKit

extension UIColor {
   
    static func dynamicColor(light: UIColor, dark: @autoclosure () -> UIColor) -> UIColor {
        if #available(iOS 13.0, *) {
            let colorInDarkMode = dark()
            return UIColor { traitCollection in
                switch traitCollection.userInterfaceStyle {
                case .dark: return colorInDarkMode
                default: return light
                }
            }
        }
        else {
            return light
        }
    }
    
    static func color(hexInt: UInt32, alpha: CGFloat = 1.0) -> UIColor {
        let color = UIColor(
            red: CGFloat((hexInt & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hexInt & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(hexInt & 0x0000FF) / 255.0,
            alpha: alpha
        )
        return color
    }
}
