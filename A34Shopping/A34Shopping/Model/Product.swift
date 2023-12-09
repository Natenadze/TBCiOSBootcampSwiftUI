//
//  Product.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import Foundation


enum Category {
    case fruit
    case vegetable
    case drink
}

// MARK: - Product
struct Product: Identifiable {
    
    // MARK: - Properties
    let id = UUID()
    let name: String
    let category: Category
    let image: String
    let stock: Int
    var cartQuantity: Int
    var isFavorite: Bool
    
    // MARK: - Init
    init(
        name: String, 
        category: Category,
        image: String,
        stock: Int,
        cartQuantity: Int = 0,
        isFavorite: Bool = false
    ) {
        self.name = name
        self.category = category
        self.image = image
        self.stock = stock
        self.cartQuantity = cartQuantity
        self.isFavorite = isFavorite
    }
    
}


// MARK: - extension Methods
extension Product {
    func toggleIsFavorite() -> Product {
        .init(name: name, category: category, image: image, stock: stock, cartQuantity: cartQuantity, isFavorite: !isFavorite)
    }
}


// MARK: - extension dummy products
extension Product {
    
    static let initialProducts: [Product] = [
        .init(name: "broccoli", category: .vegetable, image: "broccoli", stock: 10),
        .init(name: "bellpepper", category: .vegetable, image: "bellpepper", stock: 15),
        .init(name: "banana", category: .fruit, image: "banana", stock: 5),
        .init(name: "orangeJuice", category: .vegetable, image: "orangeJuice", stock: 7),
        .init(name: "berryJuice", category: .vegetable, image: "berryJuice", stock: 50),
    ]
}
