//
//  GameObject.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/7/25.
//

import Foundation


@Observable
class GameObject: Identifiable, Equatable, Hashable {
    let id = UUID()
    var gameObjectName: String?

    static func == (lhs: GameObject, rhs: GameObject) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

protocol SelectableGameObject: Identifiable, Equatable, Hashable {
    var displayName: String { get }
}
