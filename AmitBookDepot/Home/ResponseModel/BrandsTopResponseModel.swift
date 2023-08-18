//
//  BrandsTopResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
// MARK: - BrandsTopResponseModel
struct BrandsTopResponseModel: Codable {
    let data: [BrandsTopResponseDetails]?
    let success: Bool?
    let status: Int?
}
struct BrandsTopResponseDetails: Codable {
    let name, logo, photo, bgcolor: String?
    let toppublisher: String?
    let links: BrandLinks?
    let brandimagebaseurl: String?
    let brandimages: [Brandimage]?
}

struct BrandLinks: Codable {
    let products: String?
}

struct Brandimage: Codable {
    let id: Int?
    let brand_id, image_url, created_at, updated_at: String?
}
