//
//  UIColor+Ext.swift
//  weather-app
//
//  Created by tinhpv4 on 6/29/21.
//

import UIKit
import SwiftUI

fileprivate extension UIColor {
    convenience init(hexString: String) {
        let start = hexString.index(hexString.startIndex, offsetBy: hexString.hasPrefix("#") ? 1 : 0)
        var hex = String(hexString[start...])
        hex += hex.count == 6 ? "FF" : ""

        assert(hex.count == 8, "Please provide a valid hex string")

        var hexNumber: UInt64 = 0
        let scanner = Scanner(string: hex)
        scanner.scanHexInt64(&hexNumber)

        let redValue = CGFloat((hexNumber & 0xFF00_0000) >> 24) / 255
        let greenValue = CGFloat((hexNumber & 0x00FF_0000) >> 16) / 255
        let blueValue = CGFloat((hexNumber & 0x0000_FF00) >> 8) / 255
        let alphaValue = CGFloat(hexNumber & 0x0000_00FF) / 255

        self.init(red: redValue, green: greenValue, blue: blueValue, alpha: alphaValue)
    }
    
    
    static var lightGray: UIColor { return .init(hexString: "#dadada") }
}


extension Color {
    static var backgroundColor = Color(.lightGray)
}
