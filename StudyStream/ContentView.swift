import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                Image("purple wallpaper")
                    .resizable()
                    .cornerRadius(20)
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Text("Hello")
                    .font(.title)
                    .foregroundColor(.white)
                    .bold()
                
            }
        }
    }
}
#Preview {
    ContentView()
}
