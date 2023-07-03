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
        .onAppear {
            setupSession()
        }
    }
    
    // A method for getting the document directory
    func getDocumentsDir() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func setupSession() {
        var configuration = ObjectCaptureSession.Configuration()
        configuration.checkpointDirectory = getDocumentsDir().appendingPathComponent("Snapshots/")
        session.start(imagesDirectory: getDocumentsDir().appendingPathComponent("Images/"), configuration: configuration)
    }
}
