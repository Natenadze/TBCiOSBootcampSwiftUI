//
//  Person.swift
//  A32SwiftUI
//
//  Created by Davit Natenadze on 06.12.23.
//

import SwiftUI


@Observable
class Person: Identifiable {
    let id = UUID()
    var image: Image
    var name: String
    var message: String
    var time: String
    var email: String
    var password: String
    var dateOfBirth: String
    var country: String
   
    
    init(
        image: Image, 
        name: String,
        email: String,
        password: String,
        dateOfBirth: String,
        country: String,
        message: String,
        time: String
    ) {
        self.image = image
        self.name = name
        self.email = email
        self.password = password
        self.dateOfBirth = dateOfBirth
        self.country = country
        self.message = message
        self.time = time
    }
}


extension Person {
    
    static var initial = [
        Person(image: Image("jail"), name: "bondo bondi", email: "bondo@gmail.com", password: "******", dateOfBirth: "12/09/2000", country: "Georgia", message: "message number 1", time: "18:14"),
        Person(image: Image("lola"), name: "maguli agulishvili", email: "maguli@gmail.com", password: "******", dateOfBirth: "05/25/1995", country: "USA", message: "message number 2", time: "Yesterday"),
        Person(image: Image("ilo"), name: "nargiza zakirova", email: "nargiza@gmail.com", password: "******", dateOfBirth: "10/15/1988", country: "Uzbekistan", message: "message number 3", time: "9/15/20"),
        Person(image: Image("wwdc"), name: "joni smith", email: "joni@gmail.com", password: "******", dateOfBirth: "02/08/1998", country: "Canada", message: "message number 4", time: "18:14"),
        Person(image: Image("wwdc2"), name: "emma johnson", email: "emma@gmail.com", password: "******", dateOfBirth: "07/12/1990", country: "Australia", message: "message number 5", time: "Yesterday"),
        Person(image: Image("dog"), name: "alex jones", email: "alex@gmail.com", password: "******", dateOfBirth: "03/21/1985", country: "UK", message: "message number 6", time: "9/15/20"),
        Person(image: Image("jail"), name: "lisa white", email: "lisa@gmail.com", password: "******", dateOfBirth: "11/30/2002", country: "India", message: "message number 7", time: "18:14"),
        Person(image: Image("dog"), name: "Ilia Meladze", email: "Ilia@gmail.com", password: "******", dateOfBirth: "03/21/1985", country: "UK", message: "message number 8", time: "9/15/20"),
        Person(image: Image("jail"), name: "Nukri Irkun", email: "Nukri@gmail.com", password: "******", dateOfBirth: "11/30/2002", country: "India", message: "message number 9", time: "18:14"),
        Person(image: Image("ilo"), name: "Loren Nerol", email: "Loren@gmail.com", password: "******", dateOfBirth: "11/30/2002", country: "Zambia", message: "message number 10", time: "18:14"),
        
    ]

}
