//
//  A37GridsShoppingApp.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 19.12.23.
//

import SwiftUI

@main
struct A37GridsShoppingApp: App {
    
    @StateObject var viewModel = ProductViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}
