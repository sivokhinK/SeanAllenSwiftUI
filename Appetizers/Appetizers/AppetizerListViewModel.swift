//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 11.09.2023.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers = [Appetizer]()
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
