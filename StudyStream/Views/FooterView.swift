//
//  FooterView.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/21/23.
//

import Foundation
import SwiftUI

struct FooterView: View {
    @State var changeVolume = false
    @State var currentTime = audioPlayer?.currentTime
    @State var beginMusic = true

    var body: some View {
        HStack {
            Button(action: {
                self.changeVolume.toggle()

                if beginMusic == true {
                    playRandomSong()
                    beginMusic = false
                }

                if changeVolume == true {
                    //playSound(sound: "forest-music", type: "mp3", atTime: currentTime)
                    resumeSound()
                } else {
                    pauseSound()
                    currentTime = audioPlayer?.currentTime
                }


            }) {
                Image(systemName: self.changeVolume == true ? "speaker.wave.3" : "speaker.slash")
                    .foregroundColor(.white)
            }.background(
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
                .stroke(.white, lineWidth: 2)
            ).controlSize(.small)
                .buttonStyle(.bordered)
        } //hstack
        
    }
}
    #Preview {
        FooterView()
    }
