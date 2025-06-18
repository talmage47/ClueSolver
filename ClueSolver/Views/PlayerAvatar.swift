//
//  PlayerAvatar.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 6/17/25.
//

import SwiftUI

struct PlayerAvatar: View {
    var playerName: String = "Myla"
    
    var body: some View {
        
        Text(playerName)
            .font(.title2)
            .foregroundColor(.white)
            .padding(20)
            .background(
                GeometryReader { geo in
                    let size = max(geo.size.width, geo.size.height)
                    ZStack {
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: size, height: size)
                            .glassEffect()
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    .position(x: geo.size.width / 2, y: geo.size.height / 2) // ⬅️ Center the circle
                }
            )
            .fixedSize()
    }
}

#Preview {
    PlayerAvatar()
}
