//
//  OTPModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 06/08/23.
//

import Foundation
class OTPModel {
    var otp: String = ""
    var phone: String = ""
    init() {
    }
    init(otp: String, phone: String) {
        self.otp = otp
        self.phone = phone
    }
}
