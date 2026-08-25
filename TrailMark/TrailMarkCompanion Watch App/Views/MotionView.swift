import SwiftUI
import TrailmarkCore

struct MotionView: View {
    @Environment(WatchModel.self) private var model

    var body: some View {
        List {
            Section {
                HStack {
                    Image(systemName: model.motion.activity.symbolName)
                        .font(.title2)
                        .foregroundStyle(.teal)
                    Text(model.motion.activity.label)
                        .font(.headline)
                }
            } header: {
                Text("Activity")
            }

            Section {
                LabeledContent("Cadence", value: "\(Int(model.motion.cadence)) spm")
                LabeledContent("Steps", value: "\(model.motion.stepsToday)")
                LabeledContent("Accel", value: String(format: "%.2f g", model.motion.accelerationMagnitude))
            } header: {
                Text("Derived signals")
            }
        }
        .navigationTitle("Motion")
        .onAppear { model.motion.start() }
        .onDisappear { model.motion.stop() }
    }
}
