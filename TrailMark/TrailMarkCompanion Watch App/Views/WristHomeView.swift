import SwiftUI
import TrailmarkCore

struct WristHomeView: View {
    @Environment(WatchModel.self) private var model

    private var summary: ActivitySummary {
        model.connectivity.mirroredSummary ?? model.health.todaySummary
    }

    var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 4) {
                Text("Steps today")
                    .font(.caption2)
                    .foregroundStyle(.secondary)

                Text(summary.stepsText)
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .contentTransition(.numericText())

                Text(summary.distanceText)
                    .font(.footnote)
                    .foregroundStyle(.secondary)

                NavigationLink {
                    WristMemoView()
                } label: {
                    Label("Record Memo", systemImage: "mic.fill")
                }
                .buttonStyle(.borderedProminent)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .listRowBackground(Color.clear)
        }
    }
}
