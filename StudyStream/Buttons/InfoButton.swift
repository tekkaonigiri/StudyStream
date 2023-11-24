//
//  InfoButton.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/23/23.
//

import Foundation
import SwiftUI

struct InfoButton: View {
    @State private var showInfoView = false

    var body: some View {
        HStack {
            Button(action: {
                showInfoView.toggle()
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.white)
                    .imageScale(.large)
                    
            }
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
        } //hstack
        
    }
}
#Preview {
    InfoButton()
}
