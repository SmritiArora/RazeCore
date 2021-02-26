import UIKit

public class RazeCore {
    
    /// Allows you to convert a 6 digit hexadecimal string into a UIColor instance.
    /// - Warning: The '#' symbol is stripped from the beginning of string passed here.
    /// - Parameters:
    ///   - hexString: A 6-digit hexadecimal string. Use 6-digits rather than 8, and add accompanying alpha value in second parameter.
    ///   - alpha: A number between 0.0 and 1.0 indicating how transparent the color will be.
    /// - Returns: A UIColor defined by the 'hexString' parameter.
    internal class func colorFromHexString(hexString: String, alpha: CGFloat = 1.0) -> UIColor {
        let r,g,b: CGFloat
        let offset = hexString.hasPrefix("#") ? 1 : 0
        let start = hexString.index(hexString.startIndex, offsetBy: offset)
        let hexColor = String(hexString[start...])
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            r  = CGFloat((hexNumber & 0xff0000) >> 16) / 255
            g  = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
            b  = CGFloat((hexNumber & 0x0000ff)) / 255
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }
        return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
    }
    
    /// The accessible Color from raze framework
    public static var razeColor: UIColor {
        return self.colorFromHexString(hexString: "450998")
    }
    
    /// The second accessible color from the framework
    public static var secondaryColor: UIColor {
        return self.colorFromHexString(hexString: "ABCDEF")
    }
}
