//
//  ResponseModel.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//

import Foundation

struct ProductResponse: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, productDescription: String
    let price: Double
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand, category, thumbnail: String
    let images: [String]
    
    enum CodingKeys: String, CodingKey {
        case id, title, price, discountPercentage, rating, stock, brand, category, thumbnail, images
        case productDescription = "description"
    }
}
