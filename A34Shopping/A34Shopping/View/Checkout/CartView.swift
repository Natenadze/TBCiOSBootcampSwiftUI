//
//  CartView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 10.12.23.
//

import SwiftUI

struct CartView: View {
    
    // MARK: - Properties
    @Environment(ProductViewModel.self) private var viewModel
    
    // MARK: - Body
    var body: some View {
        VStack {
            header
            listView
        }
    }
    
    // MARK: - Methods
    func deleteItems(at offsets: IndexSet) {
        viewModel.updateAllProducts(for: offsets.first ?? 0)
        viewModel.cartProducts.remove(atOffsets: offsets)
    }
}


// MARK: - header
extension CartView {
    
    private var header: some View {
        HStack {
            Text("Basket")
                .padding()
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
        }
    }
}

// MARK: - List view
extension CartView {
    
    private var listView: some View {
        List {
            cartItem
            
            HStack {
                Spacer()
                Text("Total: $\(viewModel.total.formattedString)")
                    .font(.title)
            }
        }
    }
}

// MARK: - Extension cartItem
extension CartView {
    
    private var cartItem: some View {
        Section {
            ForEach(viewModel.cartProducts, id: \.name) { item in
                HStack {
                    Image(item.image)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    quantityPriceAndSumView(for: item)
                }
            }
            .onDelete (perform: deleteItems)
        }
    }
}


// MARK: - extension quantityPriceAndSumView
extension CartView {
    
    private func quantityPriceAndSumView(for item: Product) -> some View {
        VStack(spacing: 20) {
            HStack {
                Text(item.name)
                    .font(.title2)
                
                Spacer()
                
                Text("\(item.cartQuantity)x")
                
                Text("$\((item.isOnSale ? item.discountedPrice : item.price).formattedString)")
            }
            
            HStack {
                Spacer()
                
                Text("sum: $\((Double(item.cartQuantity) * (item.isOnSale ? item.discountedPrice : item.price)).formattedString)")
                    .font(.title)
            }
        }
    }
}
