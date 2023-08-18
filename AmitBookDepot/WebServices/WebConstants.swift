//
//  ApiManager.swift
//  AmitBookDepot
//
//  Created by Tushar Verma on 05/07/23.
//

import Foundation
import UIKit
import GoogleSignIn
import IQKeyboardManagerSwift
import SQLite3

struct APIConstants {
    static let statusCode               = "statusCode"
    static let response                 = "response"
    static let data                     = "data"
    static let message                  = "message"
    static let responseType             = "responseType"
    static var deviceToken              = "1234567890"
}

struct GenericErrorMessages {
    static let internalServerError      = "Something went wrong. Try again."
    static let noInternet               = "No internet connection."
}

//"https://amitbookdepot.com/api/v1/auth/reset_password_with_code"
//"https://amitbookdepot.com/api/v1/auth/signup"

struct APIUrl {
    static let host                     = Bundle.main.object(forInfoDictionaryKey: "BaseURL") as? String ?? ""
    static let baseUrlWithOutHttp       = Bundle.main.object(forInfoDictionaryKey: "BASE_URL_WITHOUT_HTTP") as? String
    static var baseUrl: String {
        return host + "api/"
    }
    struct UserApis {
        static let baseURLImage                     = host                 + "public/"
        private static let basePreFix               = baseUrl              + "v1/auth/"
        private static let basePreFixTwo            = baseUrl              + "v1/"
        static let signUp                           = basePreFix           + "signup"
        static let login                            = basePreFix           + "login"
        static let sendotplogin                     = basePreFix           + "sendotplogin"
        static let forgotPassword                   = basePreFix           + "reset_password_with_code"
        static let verifyOTP                        = basePreFix           + "verifyPhoneLogin"
        static let resendotplogin                   = basePreFix           + "resendotplogin"
        
        static let settings                         = basePreFixTwo           + "settings"
        static let categoriesFeatured               = basePreFixTwo           + "categories/featured"
        static let sliders                          = basePreFixTwo           + "sliders"
        static let productsTodaysDeal               = basePreFixTwo           + "products/todays-deal"
        static let productsFeatured                 = basePreFixTwo           + "products/featured"
        static let productsFlashDeal                = basePreFixTwo           + "products/flash-deal"
        static let productsBestSeller               = basePreFixTwo           + "products/best-seller"
        static let brandsTop                        = basePreFixTwo           + "brands/top"
        static let categories                       = basePreFixTwo           + "categories"
        
    }
}
