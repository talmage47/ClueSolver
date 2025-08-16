//
//  LoadPresetView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/2/25.
//

import SwiftUI

struct LoadPresetView: View {
    @Binding var navPath: NavigationPath

    var body: some View {
        ZStack {
            Image("mansion1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Loaded Game Preset")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .ignoresSafeArea(edges: .horizontal)
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State private var navPath = NavigationPath()

    var body: some View {

        return LoadPresetView(
            navPath: $navPath,
        )
    }
}
