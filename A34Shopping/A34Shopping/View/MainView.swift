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
