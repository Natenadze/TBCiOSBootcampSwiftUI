//
//  News.swift
//  A41UIViewRepresentable
//
//  Created by Davit Natenadze on 27.12.23.
//

import Foundation

struct News: Decodable {
    let articles: [Articles]
}

struct Articles: Decodable {
    let title: String
    let description: String?
    let urlToImage: String?
    let content: String?
    let publishedAt: String?
}
