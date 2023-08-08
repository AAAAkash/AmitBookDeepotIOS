

import Foundation
import UIKit

extension UIButton {
    func roundCorners() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    func borderColours(color: UIColor, width: CGFloat ) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    func backgroundColours(color: UIColor) {
        self.layer.backgroundColor = color.cgColor
        //self.layer.borderWidth = width
    }
}
