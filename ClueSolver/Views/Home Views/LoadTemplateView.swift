//
//  LoadPresetView.swift
//  ClueSolver
//
//  Created by Talmage Gaisford on 7/2/25.
//

import SwiftUI

struct LoadTemplateView: View {
    @Binding var navPath: NavigationPath
    
    @State private var selectedTemplate: Template? = nil
    @State private var showSheet = false
    @State var fetchedTemplates = Array((try? Model.shared.fetchTemplates(context: Model.shared.context)) ?? [])

    var body: some View {
        
        ZStack {
            Image("mansion1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                Button("Load Mock Game") {
                    Model.shared.currentGame = Game.mockGame()
                }
                Spacer()
                
                ScrollView {
                        ForEach(fetchedTemplates, id: \.id) { template in
                            Button(action: {
                                selectedTemplate = template
//                                showSheet = true
                            }) {
                                Text(template.name ?? "Unnamed Template")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.white.opacity(0.8))
                                    .cornerRadius(10)
                                    .foregroundColor(.black)
                            }
                        }
                        .onDelete(perform: deleteTemplates)
                }
                .padding(.bottom, 20)
            }
        }
        
        .sheet(item: $selectedTemplate) {template in
            ZStack {
                Color("SheetBackground").ignoresSafeArea()
                VStack {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(Color("UnselectedButton"))
                        .frame(width: 40, height: 6)
                        .padding(.top, 8)
                    
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
                            navPath.append(Route.newGame(Model.shared.TemplateToGame(template)))
                        }
                        .font(.title3)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        Spacer()
                    }.padding()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
    
    func deleteTemplates(at offsets: IndexSet) {
        fetchedTemplates.remove(atOffsets: offsets)
    }
    
}

#Preview {
    PreviewWrapper()
}

private struct PreviewWrapper: View {
    @State private var navPath = NavigationPath()

    var body: some View {

        return LoadTemplateView(
            navPath: $navPath,
        )
    }
}

