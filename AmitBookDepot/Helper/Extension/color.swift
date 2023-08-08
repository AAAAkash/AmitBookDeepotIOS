

import Foundation
import UIKit

struct Color {
    static let color1                                 = UIColor(hex: "#28D8D8")!
    static let color2                                 = UIColor(hex: "#FFD22C")!
    static let textFldTintColor                       = UIColor(hex: "##959595")!
    static let textFldTextColor                       = UIColor(hex: "##2A383D")!
}

extension UIColor {
    
    var hexString: String {
        let components = self.cgColor.components
        let red: CGFloat = components?[0] ?? 0.0
        let green: CGFloat = components?[1] ?? 0.0
        let blue: CGFloat = components?[2] ?? 0.0
        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(red * 255)), lroundf(Float(green * 255)), lroundf(Float(blue * 255)))
        return hexString
    }

    public convenience init?(hex: String) {
        if hex == "" {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
            return
        }
        var colorString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        colorString = colorString.replacingOccurrences(of: "#", with: "").uppercased()
        let alpha: CGFloat = 1.0
        let red: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 0, length: 2)
        let green: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 2, length: 2)
        let blue: CGFloat = UIColor.colorComponentFrom(colorString: colorString, start: 4, length: 2)
        self.init(red: red, green: green, blue: blue, alpha: alpha)
        return
    }
    
    private static func colorComponentFrom(colorString: String, start: Int, length: Int) -> CGFloat {

        let startIndex = colorString.index(colorString.startIndex, offsetBy: start)
        let endIndex = colorString.index(startIndex, offsetBy: length)
        let subString = colorString[startIndex..<endIndex]
        let fullHexString = length == 2 ? subString : "\(subString)\(subString)"
        var hexComponent: UInt32 = 0
        guard Scanner(string: String(fullHexString)).scanHexInt32(&hexComponent) else {
            return 0
        }
        let hexFloat: CGFloat = CGFloat(hexComponent)
        let floatValue: CGFloat = CGFloat(hexFloat / 255.0)
        return floatValue
    }
}

extension UIColor {
    class func rbg(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        let color = UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1)
        return color
    }
    
    class func RGBA(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        let color = UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
        return color
    
    }
}
