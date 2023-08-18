//
//  SliderResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation

// MARK: - SliderResponseModel
struct SliderResponseModel: Codable {
    let data: [SliderResponseDetails]?
    let success: Bool?
    let status: Int?
}

struct SliderResponseDetails: Codable {
    let photo: String?
    let title: String?
    let color: String?
}
