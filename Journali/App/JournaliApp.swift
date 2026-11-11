import SwiftUI

// App entry point. Starts the app and shows RootView.

@main
struct JournaliApp: App {
    var body: some Scene {
        WindowGroup {
            RootView()
                .preferredColorScheme(.dark)
        }
    }
}
