//
//  LoadPresetView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/2/25.
//

import SwiftUI

struct LoadTemplateView: View {
    var model: Model
    @Binding var navPath: NavigationPath
    @Environment(\.managedObjectContext) private var context
    
    @State private var selectedTemplate: Template? = nil
    @State private var showSheet = false

    var body: some View {
        ZStack {
            Image("mansion1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                Button("Load Mock Game") {
                    model.currentGame = Game.mockGame()
                }
                Spacer()
                
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(Array((try? model.fetchTemplates(context: context)) ?? []), id: \.id) { template in
                            Button(action: {
                                selectedTemplate = template
                                showSheet = true
                            }) {
                                Text(template.name ?? "Unnamed Template")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                .padding(.bottom, 20)
            }
        }
        .sheet(isPresented: $showSheet) {
            if let template = selectedTemplate {
                VStack(spacing: 16) {
                    Text(template.name ?? "Unnamed Template").font(.title2).padding(.top)
                    Divider()
                    Text("Characters").font(.headline)
                    if let characters = template.characters {
                        ForEach(Array(characters), id: \.self) { character in
                            Text(character.name)
                        }
                    }
                    Divider()
                    Text("Weapons").font(.headline)
                    if let weapons = template.weapons {
                        ForEach(Array(weapons), id: \.self) { weapon in
                            Text(weapon.name)
                        }
                    }
                    Divider()
                    Text("Rooms").font(.headline)
                    if let rooms = template.rooms {
                        ForEach(Array(rooms), id: \.self) { room in
                            Text(room.name)
                        }
                    }
                    Spacer()
                    Button("Confirm Load") {
                        showSheet = false
                        navPath.append(Route.newGame(model.TemplateToGame(template)))
                    }
                    .font(.title3)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    Spacer()
                }.padding()
            } else {
                Text("No template selected.")
            }
        }
    }
}

//#Preview {
//    PreviewWrapper()
//}
//
//private struct PreviewWrapper: View {
//    @State private var navPath = NavigationPath()
//
//    var body: some View {
//
//        return LoadTemplateView(
//            navPath: $navPath,
//        )
//    }
//}

