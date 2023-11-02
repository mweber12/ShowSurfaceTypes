//
//  ShowSurfaceTypesApp.swift
//  ShowSurfaceTypes
//
//  Created by Matthias Weber on 02.11.23.
//

import SwiftUI

@main
struct ShowSurfaceTypesApp: App {
    var body: some Scene {
        WindowGroup(id: "ContentView") {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.mixed), in: .mixed)
    }
}
