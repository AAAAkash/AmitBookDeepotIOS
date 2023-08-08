//
//  SignUpResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 05/08/23.
//

import Foundation
// MARK: - SignupResponseModel
struct SignupResponseModel: Codable {
    let message: String?
    let statusCode: Int?
    let access_token: String?
    let user: UserDetail?
    let token_type: String?
}

struct UserDetail: Codable {
    let address: String?
    let avatar: String?
    let avatar_original: String?
    let city: String?
    let country: String?
    let email: String?
    let id: String?
    let name: String?
    let phone: String?
    let postal_code: String?
    let type: String?
    
}
