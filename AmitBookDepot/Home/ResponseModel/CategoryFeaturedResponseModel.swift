//
//  CategoryFeaturedResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
// MARK: - CategoryFeaturedResponseModel
struct CategoryFeaturedResponseModel: Codable {
    let data: [CategoryFeaturedDeatils]?
    let success: Bool?
    let status: Int?
}

struct CategoryFeaturedDeatils: Codable {
    let name: String?
    let banner: String?
    let icon: String?
    let links: CategoryFeaturedLinks?
}
struct CategoryFeaturedLinks: Codable {
    let products: String?
    let sub_categories: String?
    let sub_categories_count: Int?
}
