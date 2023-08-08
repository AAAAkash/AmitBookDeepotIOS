

import Foundation
import UIKit

struct SplashStoryboard {
    static let splash = UIStoryboard(name: "Splash", bundle: nil)
}

struct AppStoryBoards {
    static let home                                         = UIStoryboard(name: "Home", bundle: nil)
    static let library                                      = UIStoryboard(name: "Library", bundle: nil)
    static let search                                       = UIStoryboard(name: "Search", bundle: nil)
    static let cart                                         = UIStoryboard(name: "Cart", bundle: nil)
    static let profile                                      = UIStoryboard(name: "Profile", bundle: nil)
    static let loginSignUp                                      = UIStoryboard(name: "LoginSignUp", bundle: nil)
}

struct LoginSignUpControllers {
    static let loginVC = AppStoryBoards.loginSignUp.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
    static let signUpVC = AppStoryBoards.loginSignUp.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
}

extension ValidationError {
    static let emptyEmail                       = "Please enter email."
    static let emptyMobile                       = "Please enter mobile number."
    static let invalidMobile                       = "Mobile number should be of 10 digits"
    static let invalidEmail                     = "Please enter a valid email."
    static let emptyPassword                     = "Please enter password."
    static let emptyConfirmPassword                     = "Please enter confirm password."
    static let invalidPassword                     = "Password should be a minimum of 6 cheracters."
    static let invalidConfirmPassword                     = "Confirm Password should be a minimum of 6 cheracters."
    static let noMatchPassword                     = "Password and Confirm Password do not match."
    static let agreeTerms                     = "Please accept terms and conditions"
    static let emptyFullName                       = "Please enter full name."
    static let emptyOTP                       = "Please enter complete OTP."
}
