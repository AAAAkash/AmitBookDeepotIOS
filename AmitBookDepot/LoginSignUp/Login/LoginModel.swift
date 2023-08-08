//
//  LoginModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import Foundation
class LoginModel {
    var email: String = ""
    var password: String = ""
    init() {
    }
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
