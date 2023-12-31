//
//  ProductListView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 13.12.23.
//

import SwiftUI


struct ProductListView: View {
    
    @Environment(ProductViewModel.self) private var viewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Products")
                    .padding()
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                
                Button {
                    viewModel.applyDiscount()
                } label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 46, height: 36)
                        .padding(.trailing)
                        .foregroundStyle(viewModel.cartProducts.count > 0 ? .gray : .red)
                        .overlay {
                            Text("%")
                                .font(.title)
                                .foregroundStyle(.white)
                                .padding(.trailing)
                        }
                }
                .disabled(viewModel.cartProducts.count > 0 ? true : false)

            }
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.allProducts, id: \.name) { product in
                        ProductCellView(product: product)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}
