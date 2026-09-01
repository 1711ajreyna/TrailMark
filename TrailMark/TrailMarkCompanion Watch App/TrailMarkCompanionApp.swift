import SwiftUI

@main
struct TrailMarkCompanion_Watch_AppApp: App {
    @State private var model = WatchModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
