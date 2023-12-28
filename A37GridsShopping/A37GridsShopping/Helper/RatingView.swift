//
//  RatingBarView.swift
//  A37GridsShopping
//
//  Created by Davit Natenadze on 25.12.23.
//

import SwiftUI

struct RatingBarView: View {
    
    
    // MARK: - Properties
    var selected: Double
    
    // MARK: - Init
    init(selected: Double) {
        self.selected = selected
    }
    
    // MARK: - body
    var body: some View {
        stars
            .overlay(
                overlay.mask(stars)
            )
    }
    
    // MARK: - components
    var stars: some View {
        HStack {
            ForEach(0..<5) { _ in
                Image(systemName: "star.fill")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
    
    var overlay: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .foregroundStyle(.yellow)
                    .frame(width: CGFloat(selected) / 5 * geometry.size.width)
            }
        }
    }
}
