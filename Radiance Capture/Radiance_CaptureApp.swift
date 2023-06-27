//
//  Radiance_CaptureApp.swift
//  Radiance Capture
//
//  Created by Dylan Hu on 6/27/23.
//

import SwiftUI
import SwiftData

@main
struct Radiance_CaptureApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
