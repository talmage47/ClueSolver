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
        Text("Load Game Preset")
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
