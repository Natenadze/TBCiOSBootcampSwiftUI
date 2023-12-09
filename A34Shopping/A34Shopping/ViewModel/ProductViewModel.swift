//
//  ProductViewModel.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import Foundation

enum Operation {
    case plus
    case minus
}

@Observable
class ProductViewModel {
    
    // MARK: - Properties
    var products = Product.initialProducts
    
    // MARK: - Methods
    func increaseCartQuantity(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id}) {
            products[index].cartQuantity += 1
        }
    }

    func decreaseCartQuantity(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id}) {
            products[index].cartQuantity -= 1
        }
    }
    
    func handleIsFavoriteTapped(_ product: Product) {
        if let index = products.firstIndex(where: { $0.id == product.id}) {
            products[index] = product.toggleIsFavorite()
        }
    }
    
}
