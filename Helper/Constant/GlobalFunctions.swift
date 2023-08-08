

import Foundation
import SwiftMessages

func convertDateFormatString(dateTimeRequired:String, previousFormat:String, reqiuredFormat:String) -> String {
    let previousFormatter = DateFormatter()
    previousFormatter.dateFormat = previousFormat
    previousFormatter.timeZone = TimeZone(identifier: "UTC")

    let previousDate = previousFormatter.date(from: dateTimeRequired) ?? Date()
    let requiredFormatter = DateFormatter()
    requiredFormatter.dateFormat = reqiuredFormat
    requiredFormatter.timeZone = TimeZone(identifier: "UTC")

    return (requiredFormatter.string(from: previousDate))
}

func showMessage(with title: String, theme: Theme = .error) {
    SwiftMessages.show {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureContent(title: title, body: title, iconImage: Icon.info.image)
        view.button?.isHidden = true
//        view.bodyLabel?.font = UIFont.appRegularFont(with: 15)
        view.titleLabel?.isHidden = true
        view.iconLabel?.isHidden = true
        return view
    }
    
    

}
