//
//  CategoryProductsView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 19.12.23.
//

import SwiftUI

struct CategoryProductsView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: ProductViewModel
    @Binding var path: NavigationPath
    var category: String
    
    var categoryProducts: [SingleProduct] {
        viewModel.allProducts.filter { $0.category == category }
    }
    
    let gridItems: [GridItem] = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    
    // MARK: - body
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Item Count: \(viewModel.totalQuantity)x")
                        Text("total price: $\(viewModel.totalPrice)")
                        Text("balance: $\(viewModel.balance)")
                    }
                    .font(.headline)
                    
                    Spacer()
                    
                    Button {
                        viewModel.checkout()
                    } label: {
                        Text("Checkout")
                            .frame(width: 100, height: 50)
                            .background(.blue)
                            .foregroundStyle(.white)
                    }

                }
                .padding(6)
                .background(.orange)
                
               productsList
            }
            
            if viewModel.showProgress {
                ProgressView()
                    .tint(.gray)
                    .scaleEffect(4)
            }
        }
        
    }
}



extension CategoryProductsView {
    
    private var productsList: some View {
        ScrollView {
            
            LazyVGrid(columns: gridItems, spacing: 16) {
                ForEach(categoryProducts) { item in
                    NavigationLink(value: item) {
                        ProductGridView(item: item)
                    }
                }
            }
            
        }
        .navigationDestination(for: SingleProduct.self) { product in
            ProductDetailView(product: product, path: $path)
        }
    }
}
