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
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                    session.cancel()
                } label: {
                    Text("Cancel").fontWeight(.semibold).foregroundStyle(.white).padding(.all, 12).font(.callout)
                }.background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)).preferredColorScheme(.dark)
                Spacer()
            }
            Spacer()
            Group {
                switch session.state {
                case .initializing:
                    Text("Initializing")
                case .ready:
                    Text("Align the dot with the center of your scene, then tap Continue.")
                case .detecting:
                    Text("Move around to ensure that the whole scene is inside the box. Drag handles to manually resize.")
                default:
                    Text("Unknown")
                }
            }.foregroundStyle(.white).font(.callout).fontWeight(.semibold).padding().multilineTextAlignment(.center)
            Group {
                switch session.state {
                case .initializing:
                    Text("Initializing")
                case .ready:
                    Button("Continue") {
                        session.startDetecting()
                    }.buttonStyle(PrimaryButtonStyle())
                case .detecting:
                    Button("Start Capture") {
                        session.startCapturing()
                    }.buttonStyle(PrimaryButtonStyle())
                default:
                    Text("Unknown")
                }
            }
        }
        .padding()
    }
}

struct PrimaryButtonStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.trigger()
        } label: {
            configuration.label
                .padding()
                .frame(maxWidth: .infinity)
                .font(.headline)
        }.buttonStyle(.borderedProminent).clipShape(.rect(cornerRadius: 12, style: .continuous))
    }
}
