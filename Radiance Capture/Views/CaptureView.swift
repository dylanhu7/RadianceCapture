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
            ObjectCaptureView(session: session)
            ObjectCaptureGuidance(session: session)
        }
    }
}

struct CreateButton: View {
    let label: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(label)
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(40)
        }
    }
}
