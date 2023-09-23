//
//  Appetizer.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 10.09.2023.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sampleAppetizer = Appetizer(id: 0001,
                                             name: "Test Appetizer",
                                             description: "Description for the appetizer.",
                                             price: 9.99,
                                             imageURL: "",
                                             calories: 99,
                                             protein: 99,
                                             carbs: 99)
    
    static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
}
