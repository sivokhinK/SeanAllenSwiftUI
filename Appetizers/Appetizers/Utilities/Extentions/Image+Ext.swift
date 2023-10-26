//
//  Image+Ext.swift
//  Appetizers
//
//  Created by Kirill Sivokhin on 26.10.2023.
//

import SwiftUI

extension Image {
    
    func StandardImageModifier() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .cornerRadius(8)
    }
}
