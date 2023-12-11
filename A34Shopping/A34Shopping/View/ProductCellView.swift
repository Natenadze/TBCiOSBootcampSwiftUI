//
//  ProductCellView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import SwiftUI

struct ProductCellView: View {
    
    // MARK: - Properties
    @Environment(ProductViewModel.self) private var viewModel
    private var product: Product
    
    // MARK: - init
    init(product: Product) {
        self.product = product
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.white
            
            VStack {
                divider
                HStack(spacing: 20) {
                    productImage
                    HStack(alignment: .bottom) {
                        productNameAndPrice
                        Spacer()
                        QuantityAndActions
                    }
                    .frame(maxWidth: .infinity)
                    .background(.white)
                }
            }
        }
    }
    
}

// MARK: - View Extensions

// MARK: - Divider
extension ProductCellView {
    
    private var divider: some View {
        RoundedRectangle(cornerRadius: 2)
            .frame(height: 1)
            .padding(.horizontal)
            .foregroundStyle(.gray)
    }
}

// MARK: - productImage
extension ProductCellView {
    
    private var productImage: some View {
        Image(product.image)
            .resizable()
            .frame(width: 120, height: 110)
            .overlay(alignment: .topTrailing) {
                if product.isOnSale {
                    Text("Sale")
                        .padding(2)
                        .background(Color.red)
                        .foregroundStyle(.white)
                        .rotationEffect(.degrees(30))
                }
            }
    }
}

// MARK: - productNameAndPrice
extension ProductCellView {
    
    private var productNameAndPrice: some View {
        VStack(spacing: 30) {
            Text(product.name)
                .lineLimit(2)
                .font(.title2)
                .fontWeight(.medium)
            
            Text(
                String("$\((product.isOnSale ? product.discountedPrice : product.price).formattedString)")
            )
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(product.isOnSale ? .red : .primary)
        }
    }
}

// MARK: - PriceAndActions
extension ProductCellView {
  
    private var QuantityAndActions: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 46, height: 36)
                .padding(.trailing)
                .foregroundStyle(product.cartQuantity == 0 ? .gray : .blue)
                .overlay {
                    Text("\(product.cartQuantity)")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.trailing)
                }
            
            HStack {
                
                Circle()
                    .foregroundStyle(product.cartQuantity == 0 ? .gray : .blue)
                    .frame(width: 36)
                    .overlay { Image(systemName: "minus") }
                    .onTapGesture {
                        viewModel.decreaseProductQuantityAndUpdateCart(product)
                    }
                    .disabled(product.cartQuantity == 0 ? true : false)
                
                Circle()
                    .foregroundStyle(product.cartQuantity == product.stock ? .gray : .blue)
                    .frame(width: 36)
                    .padding(.horizontal)
                    .overlay { Image(systemName: "plus") }
                    .onTapGesture {
                        viewModel.increaseProductQuantityAndUpdateCart(product)
                    }
                    .disabled(product.cartQuantity == product.stock ? true : false)
            }
            .foregroundStyle(.white)
            .font(.title)
        }
    }
}
