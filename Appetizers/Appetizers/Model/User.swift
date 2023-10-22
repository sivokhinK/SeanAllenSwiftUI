//
//  User.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 02.10.2023.
//

import Foundation

struct User: Codable {
    
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
}
