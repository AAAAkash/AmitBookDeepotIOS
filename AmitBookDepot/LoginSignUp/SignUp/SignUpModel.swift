//
//  SignUpModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import Foundation
class SignUpModel {
    var fullName: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var isTerms: Bool = false
    init() {
    }
    init(email: String, password: String, fullName: String, confirmPassword: String, isTerms:Bool) {
        self.email = email
        self.password = password
        self.fullName = fullName
        self.confirmPassword = confirmPassword
        self.isTerms = isTerms
    }
}
