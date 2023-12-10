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
            Text("Busket")
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
            Section {
                ForEach(viewModel.cartProducts, id: \.name) { item in
                    HStack {
                        Image(item.image)
                            .resizable()
                            .frame(width: 100, height: 100)
                        
                        VStack(spacing: 20) {
                            HStack {
                                Text(item.name)
                                    .font(.title2)
                                
                                Spacer()
                                
                                Text("\(item.cartQuantity)x")
                                
                                Text(String("$\(item.price)"))
                            }
                            
                            HStack {
                                
                                Spacer()
                                
                                Text("sum: $\(String(format: "%.2f", Double(item.cartQuantity) * item.price))")
                                    .font(.title)
                            }
                        }
                    }
                }
                .onDelete (perform: deleteItems)
            }
            
            HStack {
                Spacer()
                Text("Total: $\(String(format: "%.2f", viewModel.total))")
                    .font(.title)
            }
        }
    }
}


