

import Foundation
import UIKit

//class CircularProgressView: UIView {
//   var progressLyr = CAShapeLayer()
//   var trackLyr = CAShapeLayer()
//   required init?(coder aDecoder: NSCoder) {
//      super.init(coder: aDecoder)
//      makeCircularPath()
//   }
//    var progressClr = Color.color1 {
//      didSet {
//         progressLyr.strokeColor = progressClr.cgColor
//      }
//   }
//    var trackClr = UIColor.white {
//      didSet {
//         trackLyr.strokeColor = trackClr.cgColor
//      }
//   }
//    
//    
//   func makeCircularPath() {
//       
//       let circle = self
//
//       circle.layoutIfNeeded()
//       let centerPoint = CGPoint (x: circle.bounds.width / 2, y: circle.bounds.width / 2)
//       let circleRadius : CGFloat = circle.bounds.width / 2 * 0.83
//       
//      self.backgroundColor = UIColor.clear
//      self.layer.cornerRadius = self.frame.size.width/2
////      let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
//       let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: -CGFloat.pi/2, endAngle: 1.5 * CGFloat.pi, clockwise: true    )
//
//      trackLyr.path = circlePath.cgPath
//      trackLyr.fillColor = UIColor.clear.cgColor
//      trackLyr.strokeColor = trackClr.cgColor
//      trackLyr.lineWidth = 3.0
//      trackLyr.strokeEnd = 1.0
//      layer.addSublayer(trackLyr)
//      progressLyr.path = circlePath.cgPath
//      progressLyr.fillColor = UIColor.clear.cgColor
//      progressLyr.strokeColor = progressClr.cgColor
//      progressLyr.lineWidth = 3.0
//      progressLyr.strokeEnd = 0.0
//      layer.addSublayer(progressLyr)
//   }
//    
//   func setProgressWithAnimation(duration: TimeInterval, value: Float) {
//      let animation = CABasicAnimation(keyPath: "strokeEnd")
//      animation.duration = duration
//      animation.fromValue = 0
//      animation.toValue = value
//      animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
//      progressLyr.strokeEnd = CGFloat(value)
//      progressLyr.add(animation, forKey: "animateprogress")
//   }
//}

class CircularProgressViews: UIView {
   var progressLyr = CAShapeLayer()
   var trackLyr = CAShapeLayer()
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      makeCircularPath()
   }
    var progressClr = Color.color2 {
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
      self.layer.borderWidth = 2
      self.layer.borderColor = Color.color1.cgColor
//      let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width/2, y: frame.size.height/2), radius: (frame.size.width - 1.5)/2, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
       let circlePath = UIBezierPath(arcCenter: centerPoint, radius: circleRadius, startAngle: -CGFloat.pi/2, endAngle: 1.5 * CGFloat.pi, clockwise: true    )

      trackLyr.path = circlePath.cgPath
      trackLyr.fillColor = UIColor.clear.cgColor
      trackLyr.strokeColor = trackClr.cgColor
      trackLyr.lineWidth = 8.0
      trackLyr.strokeEnd = 1.0
      trackLyr.borderWidth = 2
      trackLyr.borderColor = Color.color1.cgColor
      layer.addSublayer(trackLyr)
      progressLyr.path = circlePath.cgPath
      progressLyr.fillColor = UIColor.clear.cgColor
      progressLyr.strokeColor = progressClr.cgColor
      progressLyr.lineWidth = 8.0
      progressLyr.strokeEnd = 0.0
      progressLyr.borderWidth = 2
      progressLyr.borderColor = Color.color1.cgColor
      layer.addSublayer(progressLyr)
   }
    
   func setProgressWithAnimation(duration: TimeInterval, value: Float) {
      let animation = CABasicAnimation(keyPath: "strokeEnd")
      animation.duration = duration
      animation.fromValue = 0
      animation.toValue = value
      animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
      progressLyr.strokeEnd = CGFloat(value)
      progressLyr.add(animation, forKey: "animateprogress")
   }
}
