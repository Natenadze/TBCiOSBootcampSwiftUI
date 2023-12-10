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
    case pizza
}

// MARK: - Product
struct Product: Identifiable {
    
    // MARK: - Properties
    let id = UUID()
    let name: String
    let category: Category
    let image: String
    let price: Double
    let stock: Int
    let cartQuantity: Int
    let isFavorite: Bool
    
    // MARK: - Init
    init(
        name: String, 
        category: Category,
        image: String,
        price: Double,
        stock: Int,
        cartQuantity: Int = 0,
        isFavorite: Bool = false
    ) {
        self.name = name
        self.category = category
        self.image = image
        self.price = price
        self.stock = stock
        self.cartQuantity = cartQuantity
        self.isFavorite = isFavorite
    }
    
}


// MARK: - extension Methods
extension Product {
    func toggleIsFavorite() -> Product {
        .init(name: name, category: category, image: image, price: price, stock: stock, cartQuantity: cartQuantity, isFavorite: !isFavorite)
    }
    
    func addProduct() -> Product {
        .init(name: name, category: category, image: image, price: price, stock: stock, cartQuantity: cartQuantity + 1, isFavorite: isFavorite)
    }  
    
    func removeProduct() -> Product {
        .init(name: name, category: category, image: image, price: price, stock: stock, cartQuantity: cartQuantity - 1, isFavorite: isFavorite)
    }
}


// MARK: - extension dummy products
extension Product {
    
    static let initialProducts: [Product] = [
        .init(name: "Broccoli",    category: .vegetable, image: "broccoli", price: 1.99, stock: 10),
        .init(name: "Bellpepper",  category: .vegetable, image: "bellpepper", price: 2.34, stock: 15),
        .init(name: "Banana",      category: .fruit, image: "banana", price: 1.35, stock: 5),
        .init(name: "OrangeJuice", category: .drink, image: "orangeJuice", price: 3, stock: 7),
        .init(name: "BerryJuice",  category: .drink, image: "berryJuice", price: 3.5, stock: 50),
        .init(name: "Pizza",       category: .pizza, image: "pizza", price: 3.99, stock: 12),
        .init(name: "RedBull",     category: .drink, image: "redbull", price: 2.34, stock: 15),
        .init(name: "Water",       category: .drink, image: "water", price: 1.35, stock: 5),
        .init(name: "Coffee",      category: .drink, image: "coffee", price: 3, stock: 7),
        
    ]
}
