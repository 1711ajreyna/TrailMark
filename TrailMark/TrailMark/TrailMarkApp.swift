//
//  TrailMarkApp.swift
//  TrailMark_CH9
//
//  Created by Ramses Garcia on 03/08/26.
//

import SwiftUI

@main
struct TrailMarkApp: App {
    @State private var model = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(model)
        }
    }
}
