

import Foundation
import UIKit

class CircularProgressView: UIView {
   var progressLyr = CAShapeLayer()
   var trackLyr = CAShapeLayer()
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      makeCircularPath()
   }
    var progressClr = Color.color1 {
      didSet {
         progressLyr.strokeColor = progressClr.cgColor
      }
   }
   var trackClr = UIColor.white {
      didSet {
         trackLyr.strokeColor = trackClr.cgColor
      }
   }
    
    
   func makeCircularPath() {
       
       
       let circle = self

       circle.layoutIfNeeded()
       let centerPoint = CGPoint (x: circle.bounds.width / 2, y: circle.bounds.width / 2)
       let circleRadius : CGFloat = circle.bounds.width / 2 * 0.83
       
      self.backgroundColor = UIColor.clear
      self.layer.cornerRadius = self.frame.size.width/2
//      let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
       let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: -CGFloat.pi/2, endAngle: 1.5 * CGFloat.pi, clockwise: true    )

      trackLyr.path = circlePath.cgPath
      trackLyr.fillColor = UIColor.clear.cgColor
      trackLyr.strokeColor = trackClr.cgColor
      trackLyr.lineWidth = 3.0
      trackLyr.strokeEnd = 1.0
      layer.addSublayer(trackLyr)
      progressLyr.path = circlePath.cgPath
      progressLyr.fillColor = UIColor.clear.cgColor
      progressLyr.strokeColor = progressClr.cgColor
      progressLyr.lineWidth = 3.0
      progressLyr.strokeEnd = 0.0
       self.backgroundColor = UIColor.white
      layer.addSublayer(progressLyr)
   }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Float, previousValue:Float) {
      let animation = CABasicAnimation(keyPath: "strokeEnd")
      animation.duration = duration
      animation.fromValue = previousValue
      animation.toValue = value
      animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
      progressLyr.strokeEnd = CGFloat(value)
      progressLyr.add(animation, forKey: "animateprogress")
   }
}

extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}
