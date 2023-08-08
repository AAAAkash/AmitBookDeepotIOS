

import Foundation
import UIKit

extension String {
    
    var isValidEmailAddress: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return testEmail.evaluate(with: self)
    }
    func isValidName() -> Bool {
        let testStr = self.trimmingCharacters(in: CharacterSet.whitespaces)
        guard testStr.count > 2, testStr.count < 30 else { return false }
        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z0-9]$)([^ ]?))$")
      //  let passwordRegx = ".*[^A-Za-z0-9 ].*"
      //  let predicateTest = NSPredicate(format: "SELF MATCHES %@",predicateTest)
        return predicateTest.evaluate(with: testStr)
    }
    var isValidNameCount: Bool {
        return !isEmpty && self.count >= 3 && self.count <= 10
    }
    
    var isValidUserNameCount: Bool {
        return !isEmpty && self.count >= 3 && self.count <= 30
    }
    var isValidNameCharactersOnly: Bool {
        return !isEmpty && range(of: ".*[^A-Za-z].*", options: .regularExpression) == nil
    }
    func isValidPassword() -> Bool {
        // least one uppercase,// least one digit// least one lowercase// least one symbol//  min 8 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{1,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
    func isValidLengthPassword() -> Bool {
        // least one uppercase// least one digit// least one lowercase// least one symbol//  min 8 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&<>*~:`-]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@", passwordRegx)
        return passwordCheck.evaluate(with: password)
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    //“((http|https)://)(www.)?” + “[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]” + “{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)”
                  
                  
    func isValidateUrl (urlString: String?) -> Bool {
        let urlRegEx = "((http|https)://)(www.)?” + “[a-zA-Z0-9@:%._\\+~#?&//=]{2,256}\\.[a-z]” + “{2,6}\\b([-a-zA-Z0-9@:%._\\+~#?&//=]*)"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: urlString)
    }
    
    var isValidURL: Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        } else {
            return false
        }
    }
    
}

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func requiredReminderDict () -> NSMutableDictionary {
        let dict = NSMutableDictionary()
        let reminderValue = self
        if reminderValue.contains("At") {
            dict["reminderType"] = "MINUTE"
            dict["reminderValue"] = 0
        } else if reminderValue.contains("Months") {
            dict["reminderType"] = "MONTH"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Months", with: ""))
        } else if reminderValue.contains("Month") {
            dict["reminderType"] = "MONTH"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Month", with: ""))
        } else if reminderValue.contains("Weeks") {
            dict["reminderType"] = "WEEK"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Weeks", with: ""))
        } else if reminderValue.contains("Week") {
            dict["reminderType"] = "WEEK"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Week", with: ""))
        } else if reminderValue.contains("Days") {
            dict["reminderType"] = "DAY"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Days", with: ""))
        } else if reminderValue.contains("Day") {
            dict["reminderType"] = "DAY"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Day", with: ""))
        } else if reminderValue.contains("Hours") {
            dict["reminderType"] = "HOUR"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Hours", with: ""))
        } else if reminderValue.contains("Hour") {
            dict["reminderType"] = "HOUR"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Hour", with: ""))
        } else if reminderValue.contains("Minutes") {
            dict["reminderType"] = "MINUTE"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Minutes", with: ""))
        } else {
            dict["reminderType"] = "MINUTE"
            dict["reminderValue"] = Int(reminderValue.replacingOccurrences(of: " Minute", with: ""))
        }
        return dict
    }
}
extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}
extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}
extension String {
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [NSAttributedString.Key.font: font], context: nil)
        return boundingBox.height
    }
}
