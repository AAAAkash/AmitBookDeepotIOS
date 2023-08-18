//
//  CategoriesResponseModel.swift
//  AmitBookDepot
//
//  Created by TUSHAR on 15/08/23.
//

import Foundation
// MARK: - CategoriesResponseModel
struct CategoriesResponseModel: Codable {
    let data: [CategoriesResponseDetails]?
    let success: Bool?
    let status: Int?
}
struct CategoriesResponseDetails: Codable {
    let name: String?
    let banner: String?
    let icon: String?
    let links: LinksCategories?
}
struct LinksCategories: Codable {
    let products: String?
    let sub_categories: String?
    let sub_categories_count: Int?
}
