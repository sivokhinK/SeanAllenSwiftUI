//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Kirill Sivokhin on 09.09.2023.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
}
