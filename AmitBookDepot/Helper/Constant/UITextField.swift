

import Foundation
import UIKit

extension UITextView {
    func setLeftPadding(_ amount: CGFloat) {
        self.textContainerInset = UIEdgeInsets(top: 15, left: amount, bottom: 5, right: 5)
    }
}

private var kAssociationKeyMaxLength: Int = 0
var rightPaddingClick: (()->())?

extension UITextField {
    var rightClick: ((_ parameter: Bool) -> Void)? {
            return { parameter in
                print(parameter)
            }
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder!: "", attributes: [NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
    func setLeftPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPadding(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
    func setRightPaddingIconLocation(icon: UIImage) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: 24.0, height: 18.0))
        btnView.setImage(icon, for: .normal)
        btnView.imageEdgeInsets = UIEdgeInsets(top: 3, left:5, bottom: 0, right: 40)
        self.rightViewMode = .always
        self.rightView = btnView
    }
    
    func setRightPaddingIcon(icon: UIImage) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: (self.frame.height), height: self.frame.height))
        btnView.addTarget(self, action: #selector(rightPaddingAction), for: .touchUpInside)
        btnView.setImage(icon, for: .normal)
        btnView.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        self.rightViewMode = .always
        self.rightView = btnView
    }
    
    func setRightPaddingWithCustomAction(icon: UIImage, target: AnyObject!, action: Selector) {
        let btnView = UIButton(frame: CGRect(x: 0, y: 0, width: (self.frame.height), height: self.frame.height))
        btnView.addTarget(target, action: action, for: .touchUpInside)
        btnView.setImage(icon, for: .normal)
        btnView.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        self.rightViewMode = .always
        self.rightView = btnView
    }
    
    @objc func rightPaddingAction(sender: UIButton) {
        rightPaddingClick?()
    }
    
    func format(with mask: String, phone: String) -> String {
        let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result = ""
        var index = numbers.startIndex // numbers iterator
        // iterate over the mask characters until the iterator of numbers ends
        for ch1 in mask where index < numbers.endIndex {
            if ch1 == "X" {
                // mask requires a number in this place, so take the next one
                result.append(numbers[index])
                // move numbers iterator to the next index
                index = numbers.index(after: index)
            } else {
                result.append(ch1) // just append a mask character
            }
        }
        return result
    }
    func setLeftView(_ view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = true
        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(view)
        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: view.frame.size.width + padding,
                height: view.frame.size.height + padding
            )
        )
        view.center = CGPoint(
            x: outerView.bounds.size.width / 2,
            y: outerView.bounds.size.height / 2
        )
        leftView = outerView
    }
    
    
    @IBInspectable var maxLength: Int {
        get {
            if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
                return length
            } else {
                return Int.max
            }
        }
        set {
            objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
            self.addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
        }
    }
    
    // The method is used to cancel the check when using
    // the Chinese Pinyin input method.
    // Becuase the alphabet also appears in the textfield
    // when inputting, we should cancel the check.
    func isInputMethod() -> Bool {
        if let positionRange = self.markedTextRange {
            if let _ = self.position(from: positionRange.start, offset: 0) {
                return true
            }
        }
        return false
    }
    
    
    @objc func checkMaxLength(textField: UITextField) {
        
        guard !self.isInputMethod(), let prospectiveText = self.text,
              prospectiveText.count > maxLength
        else {
            return
        }
        
        let selection = selectedTextRange
        let maxCharIndex = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
        text = prospectiveText.substring(to: maxCharIndex)
        selectedTextRange = selection
    }
    
}
