//
//  RoompartComponents.swift
//  ShowSurfaceTypes
//
//  Created by Matthias Weber on 02.11.23.
//

import RealityKit

class RoompartComponent: Component {
    enum RoomPartType {
        case unknown
        case wall
        case table
    }
    
    var roomPartType: RoomPartType { get { return .unknown } }
}

class WallComponent: RoompartComponent {
    static let query = EntityQuery(where: .has(WallComponent.self))
    
    override var roomPartType: RoomPartType { get { return .wall } }
}

class TableComponent: RoompartComponent {
    static let query = EntityQuery(where: .has(TableComponent.self))
    
    override var roomPartType: RoomPartType { get { return .table } }
}
