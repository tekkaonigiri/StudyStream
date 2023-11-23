//Timer aspect modified from Farukh IQBAL

import SwiftUI

struct ContentView: View {
    @State private var showTimerView = false
    
    @ObservedObject var timeManager = TimeManager()
    @State var userPickIndex = 0
    let availableMins = Array (1...59)

    let offWhite = Color(red: 0.961, green: 0.961, blue: 0.961)
    
    
    var body: some View {
        ZStack {
            Image("oceanbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            
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

                FooterView()
                    .padding(.top, 250)
                
            }//main vstack
        }//main zstack
    }
}
    #Preview {
        ContentView()
    }
