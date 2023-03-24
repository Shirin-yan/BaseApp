//
//  UIColor.swift
//  BaseApp
//
//  Created by Shirin on 3/24/23.
//

import UIKit.UIColor


extension UIColor {
    static let white = UIColor(hexString: "#000000")
}


extension UIColor {
    convenience init?(hexString: String?) {
        if hexString == "" || hexString?.starts(with: "#") == false || (hexString?.count == 7) == false {
            self.init(red: 0, green: 0, blue: 0, alpha: 1)
            return
        }
        
        let input: String! = (hexString ?? "").replacingOccurrences(of: "#", with: "").uppercased()
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
            
        red = Self.colorComponent(from: input, start: 0, length: 2)
        green = Self.colorComponent(from: input, start: 2, length: 2)
        blue = Self.colorComponent(from: input, start: 4, length: 2)

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    static func colorComponent(from string: String!, start: Int, length: Int) -> CGFloat {
        let substring = (string as NSString)
            .substring(with: NSRange(location: start, length: length))
        let fullHex = length == 2 ? substring : "\(substring)\(substring)"
        var hexComponent: UInt64 = 0
        Scanner(string: fullHex)
            .scanHexInt64(&hexComponent)
        return CGFloat(Double(hexComponent) / 255.0)
    }
}
