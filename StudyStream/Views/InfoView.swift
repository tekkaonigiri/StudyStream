//
//  InfoView.swift
//  StudyStream
//
//  Created by Nicole Fong on 11/22/23.
//

import SwiftUI

struct InfoView: View {

    @Environment(\.presentationMode) var presentationMode
    //var BGcolor = Color(red: 0.529, green: 0.808, blue: 0.921)

// toggle switches
    @State var toggleMusic = true
    @State var toggleNotif = false

    var body: some View {
        VStack {
            List {
                /*
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "info.circle")
                        .padding(.leading, 300)
                        .imageScale(.large)
                }
                */

                Section ("In-App") {
                    HStack {
                        Text("Music")
                        MusicButton()
                            .padding(.leading, 215)
                            .font(.subheadline)
                    }

                    HStack {
/* COLORS
    skyBlue = Color(red: 0.529, green: 0.808, blue: 0.921)
 */                     Menu {
                            Button (action: {
                                //BGcolor = Color.white
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Sunrise")
                            })
                            Button (action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Sunset")
                            })
                            Button (action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Sunny")
                            })
                            Button (action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Midnight")
                            })
                            
                        } label: {
                            ZStack {
                                Rectangle()
                                    .fill(Color.clear)
                                Text("Background")
                                    .foregroundColor(.white)
                                    .padding(.horizontal, -156)
                            }
                        }
                    }
                }
                Section ("Other") {
                    Toggle("Notifications", isOn: $toggleNotif)
                    Text("Send Feedback")
                }
            }
        }.environment(\.colorScheme, .dark)
    }
}
#Preview {
    InfoView()
}
