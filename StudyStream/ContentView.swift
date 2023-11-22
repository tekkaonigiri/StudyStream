//Timer aspect modified from Farukh IQBAL

import SwiftUI

struct ContentView: View {
    @State private var showSetTimeSheet = false
    //@State private var showCountdownSheet = false

    @ObservedObject var timeManager = TimeManager()
    @State var userPickIndex = 0
    let availableMins = Array (1...59)
    
    var body: some View {
//MAIN//
        ZStack {
            Image("oceanbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
        VStack {
            Text("StudyStream")
                .font(.custom("JustMeAgainDownHere",
                              size: 65))
                .foregroundColor(.white)
                .padding(.bottom)
                
// set timer button
            Button {
                showSetTimeSheet.toggle()
            } label: {
                Text("Set timer")
                    .foregroundColor(.blue)
                    .font(.custom("JustMeAgainDownHere",
                                  size: 40))
            }.background(Color.white)
                .cornerRadius(30)
                .controlSize(.mini)
                .buttonStyle(.bordered)
                
                
//SECOND PAGE//
                .sheet(isPresented: $showSetTimeSheet) {
            ZStack {
                Image("right-oceanbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
            VStack {
//cancel button
            Button {
                showSetTimeSheet.toggle()
            } label: {
                Text("Cancel")
                    .foregroundColor(.blue)
                    .font(.custom("JustMeAgainDownHere",
                                  size: 40))
            }.background(Color.white)
                .cornerRadius(30)
                .controlSize(.mini)
                .buttonStyle(.bordered)
                .padding(.top, 80)
                            
//timer
            VStack {
                Text(secondsToMinutesAndSeconds(seconds: timeManager.secondsLeft))
                    .font(.custom("JustMeAgainDownHere",
                                  size: 100))
                    .padding(.top, 100)
                    .foregroundColor(.white)
                    .padding(.bottom, -5)

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
                    .accentColor(.white)
                        
                }
                Spacer()

            }.navigationBarTitle("Timer") // timer vstack

            }//2nd page
                        }//vstack
                            }//zstack
                        }//2nd page sheet - timer
                        
                        
    }//main vstack
    }//main zstack
    }//var body some view
    
    #Preview {
        ContentView()
    }
