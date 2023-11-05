import SwiftUI

struct ContentView: View {
    @State private var showSetTimeSheet = false
    @State private var showCountdownSheet = false

    var body: some View {
        ZStack {
            Image("oceanbg")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                Text("StudyStream")
                    .font(
                        .custom(
                        "JustMeAgainDownHere",
                        size: 65))
                    .foregroundColor(.white)
                    .padding(.bottom)

// set timer button
                Button {
                    showSetTimeSheet.toggle()

                } label: {
                    Text("Set timer")
                        .foregroundColor(.blue)
                        .font(
                            .custom(
                            "JustMeAgainDownHere",
                            size: 40))
                }.background(Color.white)
                    .cornerRadius(30)
                    .controlSize(.mini)
                    .buttonStyle(.bordered)

                    .sheet(isPresented: $showSetTimeSheet) {
//back button
                        Button {
                        } label: {
                            Text("Back")
                                .foregroundColor(.blue)
                                .font(
                                    .custom(
                                    "JustMeAgainDownHere",
                                    size: 40))
                        }.background(Color.white)
                            .cornerRadius(30)
                            .controlSize(.mini)
                            .buttonStyle(.bordered)

//start button
                        Button {
                        } label: {
                            Text("Start")
                                .foregroundColor(.blue)
                                .font(
                                    .custom(
                                    "JustMeAgainDownHere",
                                    size: 40))
                        }.background(Color.white)
                            .cornerRadius(30)
                            .controlSize(.mini)
                            .buttonStyle(.bordered)
                    }
                
            }
        }
    }
}
#Preview {
    ContentView()
}
