//
//  TimerView.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/21/23.
//

/* NOTE: This is the second PAGE of the app incase i somehow
 figure out how to connect 2 swift files instead of using only content view
 and sheets */

import SwiftUI

struct TimerView: View {
    @ObservedObject var timeManager = TimeManager()
    @State var userPickIndex = 0
    let availableMins = Array (1...59)

    // colors
    let offWhite = Color(red: 0.961, green: 0.961, blue: 0.961)
    let skyBlue = Color(red: 0.529, green: 0.808, blue: 0.921)

    @Environment(\.presentationMode) var presentationMode
        // LEARN THIS - ENABLES BACK BUTTON TO OG PAGE

    var body: some View {
        ZStack {
            skyBlue
                .ignoresSafeArea()
            /* Image("oceanbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea() */
            WaveView()

            VStack {
//cancel button
            Button {
                presentationMode.wrappedValue.dismiss()
                    // LEARN THIS - ENABLES BACK BUTTON TO OG PAGE
            } label: {
                Text("Cancel")
                    .foregroundColor(.blue)
                    .font(.custom("JustMeAgainDownHere",
                                  size: 40))
            }.cornerRadius(30)
                .controlSize(.mini)
                .buttonStyle(.borderedProminent)
                .tint(offWhite)
                .padding(.top, 80)
                            
//timer
            VStack {
                if timeManager.timerMode == .initial {
                    Text(secondsToMinutesAndSeconds(seconds:availableMins[userPickIndex]*60))
                        .font(.custom("JustMeAgainDownHere",
                                          size: 100))
                            .padding(.top, 100)
                            .foregroundColor(offWhite)
                            .padding(.bottom, -5)
                }
                else {
                    Text(secondsToMinutesAndSeconds(seconds: timeManager.secondsLeft))
                        .font(.custom("JustMeAgainDownHere",
                                          size: 100))
                            .padding(.top, 100)
                            .foregroundColor(offWhite)
                            .padding(.bottom, -5)
                }

//play button
                Image (systemName: timeManager.timerMode == .running ? "pause.circle.fill" : "play.circle.fill")
                        .resizable()
                        .aspectRatio (contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(.bottom, 20)
                        .onTapGesture (perform: {
                            if self.timeManager.timerMode == .initial {
                                self.timeManager.setTimerLength (minutes: self.availableMins[self.userPickIndex]*60)
                            }
                            self.timeManager.timerMode == .running ? self.timeManager.pause(): self.timeManager.start()
                        })

//reset timer button
                if timeManager.timerMode == .paused {
                    Image (systemName: "gobackward")
                        .aspectRatio (contentMode: .fit)
                        .frame(width: 70, height: 70)
                        .onTapGesture (perform: {
                            self.timeManager.reset()
                        }).foregroundColor(.white)
                }

//pick minutes
                if timeManager.timerMode == .initial {
                    Picker (selection: $userPickIndex, label: Text("")) {
                        ForEach(0..<availableMins.count, id: \.self) {
                            Text("\(self.availableMins[$0]) min")
                        }
                    }
                    .labelsHidden()
                    .accentColor(offWhite)
                }
                Spacer()

            }.navigationBarTitle("Timer") // timer vstack

        }

            //FooterView()
                //.padding(.top, 690)


    }//main vstack
    }//main zstack
    }//var body some view
    
    #Preview {
        TimerView()
    }
