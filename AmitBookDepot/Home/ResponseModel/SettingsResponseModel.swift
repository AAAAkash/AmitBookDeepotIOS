//
//  SettingsResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
// MARK: - SettingsResponseModel
struct SettingsResponseModel: Codable {
    let data: [SettingsResponseDetails]?
    let success: Bool?
    let status: Int?
}

struct SettingsResponseDetails: Codable {
    let name, logo: String?
    let facebook, twitter, instagram, youtube: String?
    let googlePlus: String?
    let currency: Currency?
    let currencyFormat: String?

    enum CodingKeys: String, CodingKey {
        case name, logo, facebook, twitter, instagram, youtube
        case googlePlus = "google_plus"
        case currency
        case currencyFormat = "currency_format"
    }
}

struct Currency: Codable {
    let name, symbol: String?
    let exchangeRate: Int?
    let code: String?

    enum CodingKeys: String, CodingKey {
        case name, symbol
        case exchangeRate = "exchange_rate"
        case code
    }
}
