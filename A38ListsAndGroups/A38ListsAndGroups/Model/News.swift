//
//  News.swift
//  A38ListsAndGroups
//
//  Created by Davit Natenadze on 21.12.23.
//

import Foundation

struct News: Identifiable {
    let id = UUID()
    let title: String
    let body: String
    let date: Date
}
