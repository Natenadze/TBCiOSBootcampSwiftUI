//
//  Destination.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import Foundation


struct Destination: Decodable, Hashable {
    let destinations: [City]
}

// MARK: - DestinationElement
struct City: Decodable, Hashable {
    let cityName: String
    let mainImage: String
    let description: String
    let transport, mustSee, hotels: [CityComponent]
}

// MARK: - Hotel
struct CityComponent: Decodable, Hashable {
    let image, name, description: String
}

