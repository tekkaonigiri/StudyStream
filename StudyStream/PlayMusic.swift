//
//  PlayMusic.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/21/23.
//

import Foundation
import AVFoundation
var audioPlayer: AVAudioPlayer?
var playlist: [String] = [
    "sedative-music",
    "forest-music",
]

func playSound (sound: String, type: String, atTime: TimeInterval? = nil) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer (contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.currentTime = atTime ?? 0.0 // learn
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

func pauseSound() {
    audioPlayer?.pause()
}

func resumeSound() {
    //audioPlayer?.play()
    if let currentTime = audioPlayer?.currentTime {
        audioPlayer?.currentTime = currentTime
        audioPlayer?.play()
    }
}

func playRandomSong() {
    let randomIndex = Int.random(in: 0..<playlist.count)
    let randomSong = playlist[randomIndex]
    playSound(sound: randomSong, type: "mp3")
}
