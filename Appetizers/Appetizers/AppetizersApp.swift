//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 10.09.2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}
