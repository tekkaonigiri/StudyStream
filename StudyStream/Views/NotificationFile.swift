//
//  NotificationFile.swift
//  StudyStream
//
//  Created by Nicole Fong on 12/23/23.
//

// NOTE: THE ALERT WILL CONTINUOUSLY APPEAR EVERYTIME USER OPENS APP IF USER DOES NOT HAVE NOTIFICATIONS ON

import Foundation
import SwiftUI
import UserNotifications

struct NotificationFile: View {
    @State private var notificationAllowed = false

    var body: some View {
        // immediately ask to allow notifications
        Text("")
            .onAppear {
                checkNotificationAuthorization()
            }
        }


// NOTIFICATION FUNCTIONS //


    func checkNotificationAuthorization() {
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == .authorized {
                    // Notifications are allowed
                    notificationAllowed = true
                } else {
                    // Notifications are not allowed
                    notificationAllowed = false
                    showNotificationAlert()
                }
            }
        }

    // Display an immediate alert
    func showNotificationAlert() {
        DispatchQueue.main.async {
            if UIApplication.shared.connectedScenes.first is UIWindowScene {

                let alert = UIAlertController(title: "Allow Notifications", message: "Do you want to allow notifications?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Allow", style: .default) { _ in
                    requestNotifAuthorize()
                    openAppSettings()
                })
                alert.addAction(UIAlertAction(title: "Don't Allow", style: .cancel) { _ in
                    // Handle not allowing notifications
                })

                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                            if let window = windowScene.windows.first {
                                window.rootViewController?.present(alert, animated: true, completion: nil)
                            }
                        }

                UserDefaults.standard.set(true, forKey: "notificationAlertShown")
                }
            }
        }

    func requestNotifAuthorize() {
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    // Permission granted
                    print("All set!")
                    notificationAllowed = true // Update the state variable
                } else if let error = error {
                    // Handle error
                    print(error.localizedDescription)
                }
            }
        }

    // opens the settings app to the page of the app -- so user can enable notifications
    func openAppSettings() {
            if let bundleIdentifier = Bundle.main.bundleIdentifier,
               let settingsURL = URL(string: UIApplication.openSettingsURLString + bundleIdentifier) {
                UIApplication.shared.open(settingsURL)
            }
        }

}
    #Preview {
        NotificationFile()
    }
