//
//  CategoriesListView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 19.12.23.
//

import SwiftUI

struct CategoriesListView: View {
    
    // MARK: - Properties
    @EnvironmentObject private var viewModel: ProductViewModel
    @State var path = NavigationPath()
    
    // MARK: - body
    var body: some View {
        
        NavigationStack(path: $path) {
            List {
                ForEach(viewModel.categories, id: \.self) { category in
                    NavigationLink(category, value: category)
                        .font(.title)
                }
            }
            .navigationDestination(for: String.self) { category in
                CategoryProductsView(path: $path, category: category)
            }
        }
        
        
    }
}


#Preview {
    CategoriesListView()
}
