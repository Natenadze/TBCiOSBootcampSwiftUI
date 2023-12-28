//
//  MainView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 19.12.23.
//

import SwiftUI

struct MainView: View {
    
    // MARK: - Properties
    
    
    // MARK: - body
    var body: some View {
        TabView {
            ProductsView()
                .tabItem { Label("Products", systemImage: "house") }
            
            CategoriesListView()
                .tabItem { Label("Categories", systemImage: "line.3.horizontal") }
        }
    }
}


#Preview {
    MainView()
}
