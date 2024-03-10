//
//  ProductDataUI.swift
//  HW
//
//  Created by RMAD201 on 3/10/24.
//


import Foundation

struct ProductUIData {
    var id: Int = 0
    var title: String = ""
    var description: String = ""
    var price: Double = 0.0
    var discountPercentage: Double = 0.0
    var rating: Double = 0.0
    var stock: Int = 0
    var brand: String = ""
    var category: String = ""
    var thumbnailURL: String = ""
    var imageURLs: [String] = []

    init(product: Product?) {
        if let product = product {
            id = product.id
            title = product.title
            description = product.productDescription
            price = product.price
            discountPercentage = product.discountPercentage
            rating = product.rating
            stock = product.stock
            brand = product.brand
            category = product.category
            thumbnailURL = product.thumbnail
            imageURLs = product.images
        }
    }
}

