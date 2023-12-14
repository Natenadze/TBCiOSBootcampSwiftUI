//
//  Destination.swift
//  A35Navigation
//
//  Created by Davit Natenadze on 13.12.23.
//

import Foundation


struct Destination: Decodable, Identifiable, Hashable {
    
    let hotels: String
    let transport: String
    let museums: String
    let hotelImage: String
    let mustSee: String
    let id: String
    
    enum CodingKeys: String, CodingKey {
        case hotels, transport, museums, hotelImage
        case mustSee = "MustSeePlaces"
        case id
    }
}


