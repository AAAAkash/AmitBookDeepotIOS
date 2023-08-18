//
//  BestSellerResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
// MARK: - BestSellerResponseModel
struct BestSellerResponseModel: Codable {
    let data: [BestSellerResponseDetails]?
    let success: Bool?
    let status: Int?
}

// MARK: - Datum
struct BestSellerResponseDetails: Codable {
    let product_id: Int?
    let name: String?
    let photos: [String]?
    let author: [Author]?
    let bgcolor: String?
    let origin: String?
    let isbn: String?
    let media_url: String?
    let thumbnail_image, featured_image: String?
    let flash_deal_image: String?
    let base_price, base_discounted_price: Double?
    let todays_deal, featured: Int?
    let video_provider: String?
    let video_link: String?
    let mrp, selling_price: String?
    let onrent: String?
    let securityamount, rentamount: String?
    let pdf: String?
    let discount: Double?
    let discount_type: String?
    let rating, sales, reviewcount: Int?
    let links: Links?

}

// MARK: - Author
struct Author: Codable {
    let name: String?
}

// MARK: - Links
struct Links: Codable {
    let details, reviews, related, top_from_seller: String?
}
