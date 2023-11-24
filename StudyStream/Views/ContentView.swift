//Timer aspect modified from Farukh IQBAL

import SwiftUI

struct ContentView: View {
    @State private var showTimerView = false
    
    @ObservedObject var timeManager = TimeManager()
    @State var userPickIndex = 0
    let availableMins = Array (1...59)

    // colors
    let offWhite = Color(red: 0.961, green: 0.961, blue: 0.961)
    let skyBlue = Color(red: 0.529, green: 0.808, blue: 0.921)
    public var BGcolor = Color(red: 0.529, green: 0.808, blue: 0.921)
    // skyBlue is default

    @State private var showHand = true
    
    var body: some View {
        ZStack {

            BGcolor.ignoresSafeArea()
            WaveView()

//tells user that they can move the wave - disappears after 6 seconds
            if showHand {
                ReminderWaveAnimation()
                    .padding(.leading, 300)
                    .padding(.vertical, -140)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                            showHand = false
                        }
                    }
            }
            
            VStack {
                Text("StudyStream")
                    .font(.custom("JustMeAgainDownHere",
                                  size: 65))
                    .foregroundColor(offWhite)
                    .padding(.bottom)
                    .padding(.top, 250)
                
// set timer button
                Button {
                    showTimerView.toggle()
                } label: {
                    Text("Set timer")
                        .foregroundColor(.blue)
                        .font(.custom("JustMeAgainDownHere",
                                      size: 40))
                }.cornerRadius(30)
                    .controlSize(.mini)
                    .buttonStyle(.borderedProminent)
                    .tint(offWhite)
                
                
                    .sheet(isPresented: $showTimerView) {
                        TimerView()
                    }



                InfoButton()
                    .padding(.top, 250)
                /* HStack {
                    MusicButton()
                        .padding(.horizontal, 10)
                    InfoButton()
                        .padding(.horizontal, 10)
                }.padding(.top, 250) */
                
            }//main vstack
        }//main zstack
    }
}
    #Preview {
        ContentView()
    }
