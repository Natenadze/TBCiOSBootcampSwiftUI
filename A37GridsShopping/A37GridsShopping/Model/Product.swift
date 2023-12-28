//
//  Product.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 25.12.23.
//

import Foundation

// MARK: - Product
struct ProductModel: Decodable {
    let products: [SingleProduct]
}

// MARK: - ProductElement
struct SingleProduct: Decodable, Identifiable, Hashable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    var stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
    var cartQuantity: Int = 0
    
    private enum CodingKeys: String, CodingKey {
        case id, title, description, price, discountPercentage, rating, stock, brand, category, thumbnail, images
    }
    
}
