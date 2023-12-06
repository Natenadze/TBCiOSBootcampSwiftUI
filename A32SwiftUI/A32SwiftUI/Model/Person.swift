//
//  Person.swift
//  A32SwiftUI
//
//  Created by Davit Natenadze on 06.12.23.
//

import SwiftUI


struct Person: Identifiable {
    let id = UUID()
    let image: Image
    let name: String
    let message: String
    let time: String
}


extension Person {
    
    static let initial = [
        Person(image: Image("jail"), name: "bondo bondi", message: "iyo da ara iyo ra", time: "18:14"),
        Person(image: Image(systemName: "house.fill"), name: "maguli agulishvili", message: "dawere amin", time: "Yesterday"),
        Person(image: Image(systemName: "person"), name: "nargiza zakirova", message: "still lovin you", time: "9/15/20"), 
        Person(image: Image("jail"), name: "bondo bondi", message: "iyo da ara iyo ra", time: "18:14"),
        Person(image: Image(systemName: "house.fill"), name: "maguli agulishvili", message: "dawere amin", time: "Yesterday"),
        Person(image: Image(systemName: "person"), name: "nargiza zakirova", message: "still lovin you", time: "9/15/20"),  
        Person(image: Image("jail"), name: "bondo bondi", message: "iyo da ara iyo ra", time: "18:14"),
        Person(image: Image(systemName: "house.fill"), name: "maguli agulishvili", message: "dawere amin", time: "Yesterday"),
        Person(image: Image(systemName: "person"), name: "nargiza zakirova", message: "still lovin you", time: "9/15/20"), 
        Person(image: Image("jail"), name: "bondo bondi", message: "iyo da ara iyo ra", time: "18:14"),
        Person(image: Image(systemName: "house.fill"), name: "maguli agulishvili", message: "dawere amin", time: "Yesterday"),
        Person(image: Image(systemName: "person"), name: "nargiza zakirova", message: "still lovin you", time: "9/15/20"),
 
    ]
}
