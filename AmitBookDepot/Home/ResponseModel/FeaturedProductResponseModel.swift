//
//  FeaturedProductViewModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
// MARK: - FeaturedProductResponseModel
struct FeaturedProductResponseModel: Codable {
    let data: [FeaturedProductResponseDetails]?
    let success: Bool?
    let status: Int?
}

// MARK: - Datum
struct FeaturedProductResponseDetails: Codable {
    let product_id: Int?
    let name: String?
    let photos: [String]?
    let author: [Author]?
    let bgcolor: String?
    let origin: String?
    let Isbn: String?
    let media_url: String?
    let thumbnail_image, featured_image, flash_deal_image: String?
    let base_price, base_discounted_price, todays_deal, featured: Int?
    let video_provider: String?
    let video_link: String?
    let mrp, selling_price: String?
    let onrent: String?
    let securityamount, rentamount: String?
    let pdf: String?
    let discount: Int?
    let discount_type: String?
    let rating, sales, reviewcount: Int?
    let links: Links?
}
