//
//  MainView.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
            TabView {
                ProductListView()
                .tabItem {
                    Label("Products", systemImage: "house")
                }
                
                CartView()
                    .tabItem {
                        Image(systemName: "cart.fill")
                        Text("Cart")
                    }
            }
    }
}


// MARK: - ProductListView
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
            }
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(viewModel.allProducts) { product in
                        ProductCellView(product: product)
                    }
                }
            }
            .padding(.horizontal, 8)
        }
    }
}


// MARK: - Preview
//#Preview {
//    MainView()
//}
