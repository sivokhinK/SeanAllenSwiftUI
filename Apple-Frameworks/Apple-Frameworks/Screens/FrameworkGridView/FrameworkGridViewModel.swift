//
//  FrameworkGridViewModel.swift
//  Apple-Frameworks
//
//  Created by Kirill Sivokhin on 09.09.2023.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    let columns: [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())
    ]
}
