//
//  ProductViewModel.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 25.12.23.
//

import Foundation
import NatenWorking


@MainActor
class ProductViewModel: ObservableObject {
    
    @Published var showAlert = false
    @Published var showProgress = false
    
    let productsUrl = "https://dummyjson.com/products"
    @Published var allProducts = [SingleProduct]()
    @Published var cartProducts = [SingleProduct]()
    @Published var balance = 5000
    var categories: [String] {
       getCategories()
    }
    
    var totalPrice: Int {
        cartProducts.reduce(0) { $0 + $1.cartQuantity * $1.price }
    }
    
    var totalQuantity: Int {
        cartProducts.reduce(0) { $0 + $1.cartQuantity }
    }
    
    // MARK: - init
    init() {
        fetchProducts(url: productsUrl)
    }
    
    // MARK: - Methods
    func fetchProducts(url: String) {
        Task {
            if let result: ProductModel = try? await NetworkManager().performURLRequest(url) {
                    allProducts = result.products
            }
        }
    }
    
    func getCategories() -> [String] {
        Array(Set(allProducts.compactMap { $0.category }))
    }
    
    
    func increaseProductQuantityAndUpdateCart(_ product: SingleProduct) {
        if let index = allProducts.firstIndex(where: { $0.title == product.title}) {
            allProducts[index].cartQuantity += 1
            addProductToCartProducts(allProducts[index])
        }
    }

    
    func addProductToCartProducts(_ product: SingleProduct) {
        if let index = cartProducts.firstIndex(where: { $0.title == product.title}) {
            cartProducts[index] = product
        }else {
            cartProducts.append(product)
        }
    }
    
    func decreaseProductQuantityAndUpdateCart(_ product: SingleProduct) {
        if let index = allProducts.firstIndex(where: { $0.title == product.title}) {
            allProducts[index].cartQuantity -= 1
            removeProductFromCartProducts(allProducts[index])
        }
    }

    
    func removeProductFromCartProducts(_ product: SingleProduct) {
        if let index = cartProducts.firstIndex(where: { $0.title == product.title}) {
            if cartProducts[index].cartQuantity == 1 {
                cartProducts.remove(at: index)
            }else {
                cartProducts[index] = product
            }
        }
    }
    
    func checkout() {
           if balance >= totalPrice {
               showProgress = true
               Task {
                   try? await Task.sleep(nanoseconds: 3_000_000_000)
                   for cartProduct in cartProducts {
                       if let index = allProducts.firstIndex(where: { $0.title == cartProduct.title }) {
                           allProducts[index].stock -= cartProduct.cartQuantity
                           allProducts[index].cartQuantity = 0
                       }
                   }
                   balance -= totalPrice
                   cartProducts = []
                   showProgress = false
               }
           } else {
               showAlert = true
           }
       }

    
}
