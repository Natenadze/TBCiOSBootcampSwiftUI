//
//  A34ShoppingApp.swift
//  A34Shopping
//
//  Created by Davit Natenadze on 09.12.23.
//

import SwiftUI

@main
struct A34ShoppingApp: App {
    
    @State private var viewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(viewModel)
        }
    }
}
