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
    var allProducts = Product.initialProducts
    var cartProducts = [Product]()
    
    var total: Double {
        cartProducts.reduce(0.0) { $0 + Double($1.cartQuantity) * ($1.price)  }
    } 
    
    // MARK: - Methods
    
        // Plus Actions
    func increaseProductQuantityAndUpdateCart(_ product: Product) {
        if let index = allProducts.firstIndex(where: { $0.name == product.name}) {
            let updatedProduct = allProducts[index].addProduct()
            allProducts[index] = updatedProduct
            addProductToCartProducts(updatedProduct)
        }
    }
    
    func addProductToCartProducts(_ product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.name == product.name}) {
            cartProducts[index] = product
        }else {
            cartProducts.append(product)
        }
    }

    // Minus Actions
    func decreaseProductQuantityAndUpdateCart(_ product: Product) {
        if let index = allProducts.firstIndex(where: { $0.name == product.name}) {
            let updatedProduct = allProducts[index].removeProduct()
            allProducts[index] = updatedProduct
            removeProductFromCartProducts(updatedProduct)
        }
    }
    
    func removeProductFromCartProducts(_ product: Product) {
        if let index = cartProducts.firstIndex(where: { $0.name == product.name}) {
            if cartProducts[index].cartQuantity == 1 {
                cartProducts.remove(at: index)
            }else {
                cartProducts[index] = product
            }
        }
    }
    
    //TODO: - ???
//    func handleIsFavoriteTapped(_ product: Product) {
//        if let index = allProducts.firstIndex(where: { $0.id == product.id}) {
//            allProducts[index] = product.toggleIsFavorite()
//        }
//    }
    
}
