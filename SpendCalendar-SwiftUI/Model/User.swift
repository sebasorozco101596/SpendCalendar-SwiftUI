//
//  User.swift
//  SpendCalendar-SwiftUI
//
//  Created by Juan Sebastian Orozco Buitrago on 3/2/22.
//

import SwiftUI

//MARK: - User Model and Sample Data

struct User: Identifiable {
    var id = UUID().uuidString
    var name: String
    var image: String
    var type: String
    var amount: String
    var color: Color
}

var users: [User] = [
    User(name: "Sebas", image: "User1", type: "Sent", amount: "-120", color: Color.black),
    User(name: "Clare", image: "User2", type: "Sent", amount: "-220", color: Color.black),
    User(name: "Ana", image: "User3", type: "Received", amount: "+1200", color: Color("Orange")),
    User(name: "Gerardo", image: "User4", type: "Sent", amount: "-620", color: Color.black),
    User(name: "Adriana", image: "User5", type: "Received", amount: "+200", color: Color("Orange")),
    User(name: "Christian", image: "User6", type: "Sent", amount: "-129", color: Color.black)
]
