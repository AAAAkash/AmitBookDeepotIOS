
import UIKit

class FloatingLabelInput: UITextField {
    var floatingLabel: UILabel!
    var infoBtn: UIButton?
    var floatingLabelHeight: CGFloat = 14
    var imageView = UIImageView(frame: CGRect.zero)
    var infoBtnClick: (()->())?
    
    private var _placeholder: String?
                
    @IBInspectable
    var _backgroundColor: UIColor = UIColor.white {
        didSet {
            self.layer.backgroundColor = self._backgroundColor.cgColor
        }
    }
    
    var labelTop : NSLayoutConstraint?
    var btnTop : NSLayoutConstraint?

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self._placeholder = (self._placeholder != nil) ? self._placeholder : placeholder
        placeholder = self._placeholder // Make sure the placeholder is shown
        
        self.tintColor = Color.textFldTextColor
        self.setLeftPadding(14)
        
        if self.floatingLabel == nil {
            self.addFloatingLabel()
        }
        self.floatingLabel.textColor = Color.textFldTintColor

        self.addTarget(self, action: #selector(self.resetFloatingLable), for: .editingDidEnd)
        self.addTarget(self, action: #selector(self.resetFloatingLable), for: .editingChanged)
    }

    // Add a floating label to the view on becoming first responder
    func addFloatingLabel() {
        self.floatingLabel = UILabel(frame: CGRect.zero)
        self.floatingLabel.textColor = UIColor.init(named: "#B2B2B2")
        self.floatingLabel.font = self.font
        self.floatingLabel.text = " " + (self._placeholder ?? "") + "  "
        self.floatingLabel.translatesAutoresizingMaskIntoConstraints = false
        self.floatingLabel.textAlignment = .center
        self.addSubview(self.floatingLabel)
        
        self.floatingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14).isActive = true
        
        labelTop = self.floatingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        labelTop?.isActive = true
        self.placeholder = ""

        self.setNeedsDisplay()
    }
    
    func addInfoBtn() {
        infoBtn = UIButton(frame: .zero)
        infoBtn?.translatesAutoresizingMaskIntoConstraints = false
        infoBtn?.addTarget(self, action: #selector(pressButton(button:)), for: .touchUpInside)

        infoBtn?.setImage(UIImage(named: "goal_info"), for: .normal)
        if let btn = infoBtn {
            self.addSubview(btn)
        }

        infoBtn?.widthAnchor.constraint(equalToConstant: 30).isActive = true
        infoBtn?.heightAnchor.constraint(equalToConstant: 20).isActive = true
        infoBtn?.leadingAnchor.constraint(equalTo: floatingLabel.trailingAnchor, constant: 0).isActive = true
        btnTop = infoBtn?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
        btnTop?.isActive = true
        
        self.bringSubviewToFront(subviews.last!)
    }
    
    @objc func pressButton(button: UIButton) {
        self.infoBtnClick?()
    }
    
    @objc func resetFloatingLable() {
        labelTop?.isActive = false
        btnTop?.isActive = false

        if self.text?.isEmpty ?? true {
            labelTop = self.floatingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)
            btnTop = infoBtn?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)

            infoBtn?.layer.backgroundColor = UIColor.clear.cgColor
            self.floatingLabel.backgroundColor = UIColor.clear
            self.floatingLabel.textColor = Color.textFldTintColor

        } else {
            labelTop = self.floatingLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(self.frame.height / 2))
            btnTop = infoBtn?.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(self.frame.height / 2))
            infoBtn?.layer.backgroundColor = UIColor.white.cgColor
            self.floatingLabel.backgroundColor = self._backgroundColor
            self.floatingLabel.textColor = Color.textFldTintColor
        }
        labelTop?.isActive = true
        btnTop?.isActive = true

        UIView.animate(withDuration: 0.5) {
            self.layoutIfNeeded()
        }
    }
}

extension UILabel {
  func countLines() -> Int {
    guard let myText = self.text as NSString? else {
      return 0
    }
    // Call self.layoutIfNeeded() if your view uses auto layout
    let rect = CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude)
    let labelSize = myText.boundingRect(with: rect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: self.font as Any], context: nil)
    return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
  }
}

extension UIScrollView {

    // Scroll to a specific view so that it's top is at the top our scrollview
    func scrollToView(view:UIView, animated: Bool) {
        if let origin = view.superview {
            // Get the Y position of your child view
            let childStartPoint = origin.convert(view.frame.origin, to: self)
            // Scroll to a rectangle starting at the Y of your subview, with a height of the scrollview
            self.scrollRectToVisible(CGRect(x:0, y:childStartPoint.y,width: 1,height: self.frame.height), animated: animated)
        }
    }

    // Bonus: Scroll to top
    func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }

    // Bonus: Scroll to bottom
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
        }
    }

}
