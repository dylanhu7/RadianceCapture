//
//  CaptureView.swift
//  Radiance Capture
//
//  Created by Dylan Hu on 6/27/23.
//

import SwiftUI
import RealityKit

struct CaptureView: View {
    @ObservedObject var session: ObjectCaptureSession
    
    var body: some View {
        ZStack {
            ObjectCaptureView(session: session).edgesIgnoringSafeArea(.all)
            ObjectCaptureGuidance(session: session)
        }
    }
}
