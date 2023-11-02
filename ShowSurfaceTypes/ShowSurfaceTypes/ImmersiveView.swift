//
//  ImmersiveView.swift
//  ShowSurfaceTypes
//
//  Created by Matthias Weber on 02.11.23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    var body: some View {
        RoompartView()
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
