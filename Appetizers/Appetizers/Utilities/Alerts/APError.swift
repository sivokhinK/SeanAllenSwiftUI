//
//  APError.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 11.09.2023.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
