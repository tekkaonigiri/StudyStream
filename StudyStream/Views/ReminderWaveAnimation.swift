//
//  ReminderWaveAnimation.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/22/23.
//

/* this is an edge.set ? so for padding, use .padding(.leading, 10)
    instead of .padding(.top, 10) */

import Foundation
import SwiftUI

struct ReminderWaveAnimation: View {
    @State private var handPosition: CGSize = .zero
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            Image(systemName: "hand.tap.fill")
                .font(.system(size: 40))
                .offset(handPosition)
        }
        .onAppear {
            AnimateHand()
        }
    }

    func AnimateHand() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 1.0)) {
                if isAnimating {
                    handPosition = CGSize(width: 0, height: -50)
                } else {
                    handPosition = CGSize(width: 0, height: 0)
                }
                isAnimating.toggle()
            }
        }
    }
}
#Preview {
    ReminderWaveAnimation()
}
