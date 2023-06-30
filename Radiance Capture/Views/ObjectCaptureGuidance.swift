//
//  ObjectCaptureGuidance.swift
//  Radiance Capture
//
//  Created by Dylan Hu on 6/29/23.
//

import SwiftUI
import RealityKit

struct ObjectCaptureGuidance: View {
    @ObservedObject var session: ObjectCaptureSession
    
    var body: some View {
        switch session.state {
        case .initializing:
            Text("Initializing")
        case .ready:
            CreateButton(label: "Continue") {
                session.startDetecting()
            }
        case .detecting:
            CreateButton(label: "Start Capture") {
                session.startCapturing()
            }
        default:
            Text("Unknown")
        }
    }
}
