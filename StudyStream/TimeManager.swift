//
//  TimeManager.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/7/23.
//

import Foundation
import SwiftUI


class TimeManager: ObservableObject {
    
    @Published var timerMode: TimerMode = .initial // initial is a state
    @Published var secondsLeft = UserDefaults.standard.integer(forKey: "timerLength") // review
    
    var timer = Timer() // review

    func setTimerLength(minutes: Int) {
        let defaults = UserDefaults.standard
        defaults.set(minutes, forKey: "timerLength")
        secondsLeft = minutes
    }
    
    func start() {
        timerMode = .running
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
            if self.secondsLeft == 0 {
                self.reset()
            }
            self.secondsLeft -= 1
        })
    }
    
    func reset() {
        self.timerMode = .initial
        self.secondsLeft = UserDefaults.standard.integer(forKey: "timerLength")
        timer.invalidate()
    }
    
    func pause() {
        self.timerMode = .paused
        timer.invalidate()
    }
}
