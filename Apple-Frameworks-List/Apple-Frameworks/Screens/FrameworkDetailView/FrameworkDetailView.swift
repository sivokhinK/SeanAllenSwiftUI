//
//  FrameworkDetailView.swift
//  Apple-Frameworks
//
//  Created by Kirill Sivokhin on 09.09.2023.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    var framework: Framework
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    
    var body: some View {
        VStack {
//            Spacer()
            
            FrameworkTitleView(framework: framework)
                .padding(.leading, 15)
            
            Text(framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            Button() {
                isShowingSafariView = true
            } label: {
//                AFButton(title: "Learn More")
                Label("Learn More", systemImage: "book.fill")
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
//            .foregroundColor(.green)
//            .buttonBorderShape(.roundedRectangle(radius: 50))
            .tint(.red)
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(
                url: URL(string: framework.urlString) ??
                     URL(string: "www.google.com")!
            )
        })
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework,
                             isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}
