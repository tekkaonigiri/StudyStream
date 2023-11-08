import SwiftUI

struct ContentView: View {
    @State private var showSetTimeSheet = false
    @State private var showCountdownSheet = false
    @State var timer: Timer = .initial
    
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
//back button
            Button {
                showSetTimeSheet.toggle()
            } label: {
                Text("Back")
                    .foregroundColor(.blue)
                    .font(.custom("JustMeAgainDownHere",
                                  size: 40))
            }.background(Color.white)
                .cornerRadius(30)
                .controlSize(.mini)
                .buttonStyle(.bordered)
                            
//timer
            VStack {
                Text("60")
                    .font(.custom("JustMeAgainDownHere",
                                  size: 40))
                    .padding(.top, 80)
            }
                            
//start button
            Button {
                showCountdownSheet.toggle()
                showSetTimeSheet.toggle()
            } label: {
                Text("Start")
                    .foregroundColor(.blue)
                    .font(.custom("JustMeAgainDownHere",
                                  size: 40))
            }.background(Color.white)
                .cornerRadius(30)
                .controlSize(.mini)
                .buttonStyle(.bordered)
                            
//countdown
                .sheet(isPresented: $showCountdownSheet) {
            ZStack {
                Image("left-oceanbg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()

//play button
            VStack {
                    Image (systemName: timer == .running ? "pause" : "resume")
                        .resizable()
                        .aspectRatio (contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                    }//countdown vstack
            }//countdown zstack

            }//3rd page sheet - countdown
                        }//vstack
                            }//zstack
                        }//2nd page sheet - timer
                        
                        
    }//main vstack
    }//main zstack
    }//var body some view
    }//struct content view
    
    #Preview {
        ContentView()
    }
