import SwiftUI
import TrailmarkCore

struct ContentView: View {
    @Environment(AppModel.self) private var model

    var body: some View {
        TabView {
            TodayDashboardView()
                .tabItem { Label("Today", systemImage: "sun.max.fill") }

            FieldJournalView()
                .tabItem { Label("Journal", systemImage: "waveform") }

            RecoveryView()
                .tabItem { Label("Recovery", systemImage: "bed.double.fill") }

            JourneyListView()
                .tabItem { Label("Journeys", systemImage: "map.fill") }
        }
        .task {
            // Request HealthKit access on launch, then load today's data.
            await model.health.requestAuthorization()
            await model.health.refreshToday()
            model.mirrorTodayToWatch()
        }
    }
}

#Preview {
    ContentView()
        .environment(AppModel())
}
