//
//  AppetizerTabView.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 10.09.2023.
//

import SwiftUI

struct AppetizerTabView: View {
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerTabView().environmentObject(Order())
    }
}
