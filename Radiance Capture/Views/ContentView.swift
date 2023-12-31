//
//  ContentView.swift
//  Radiance Capture
//
//  Created by Dylan Hu on 6/27/23.
//

import SwiftUI
import SwiftData
import RealityKit

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @StateObject var session = ObjectCaptureSession()
    @Query private var items: [Item]
    @State private var isPresented = false
    
    let columns = [
        GridItem(.adaptive(minimum: 160), alignment: .topLeading)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(items, id: \.self) { item in
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(.gray)
                            .frame(minHeight: 120)
                    }
                }
            }
            .padding()
            .navigationTitle("My Captures")
            .toolbar {
                ToolbarItem {
                    Button {
                        isPresented.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .fullScreenCover(isPresented: $isPresented) {
                CaptureView(session: session)
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
