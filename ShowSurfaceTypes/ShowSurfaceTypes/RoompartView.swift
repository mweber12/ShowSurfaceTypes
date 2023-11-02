//
//  RoompartView.swift
//  TestVision
//
//  Created by Matthias Weber on 23.08.23.
//

import RealityKit
import SwiftUI
import OSLog

struct RoompartView: View {
    @State var tableEntity: Entity = {
        let anchor = AnchorEntity(.plane(.horizontal, classification: .table, minimumBounds: SIMD2<Float>(0.6, 0.6)), trackingMode: .continuous)
        return anchor
    }()
    
    @State var wallEntity: Entity = {
        let anchor = AnchorEntity(.plane(.vertical, classification: .wall, minimumBounds: SIMD2<Float>(0.6, 0.6)), trackingMode: .continuous)
        return anchor
    }()
    
    var body: some View {
        RealityView { content, attachments in
            // add entities
            tableEntity.components.set(TableComponent())
            guard let tableAttachmentEntity = attachments.entity(for: "ShowTable") else { return }
            Self.rotateEntityAroundXAxis(entity: tableAttachmentEntity, angle: -90.0)
            tableEntity.addChild(tableAttachmentEntity)
            content.add(tableEntity)
            
            wallEntity.components.set(WallComponent())
            guard let wallAttachmentEntity = attachments.entity(for: "ShowWall") else { return }
            Self.rotateEntityAroundXAxis(entity: wallAttachmentEntity, angle: -90.0)
            wallEntity.addChild(wallAttachmentEntity)
            content.add(wallEntity)
        } attachments: {
            Attachment(id: "ShowWall") {
                VStack {
                    Text("This is a wall")
                        .font(.extraLargeTitle2)
                        .fontWeight(.regular)
                        .padding(40)
                }
                .glassBackgroundEffect()
                .scaleEffect(5)
            }
            
            Attachment(id: "ShowTable") {
                VStack {
                    Text("This is a table")
                        .font(.extraLargeTitle2)
                        .fontWeight(.regular)
                        .padding(40)
                        .fixedSize()
                }
                .glassBackgroundEffect()
                .scaleEffect(5)
            }
        }
    }
    
    static func rotateEntityAroundXAxis(entity: Entity, angle: Float) {
        // Get the current transform of the entity
        var currentTransform = entity.transform
        
        // Create a quaternion representing a rotation around the X-axis
        let rotation = simd_quatf(angle: angle * Float.pi / 180.0, axis: [1, 0, 0])
        
        // Combine the rotation with the current transform
        currentTransform.rotation = rotation * currentTransform.rotation
        
        // Apply the new transform to the entity
        entity.transform = currentTransform
    }
}

#Preview {
    RoompartView()
}
