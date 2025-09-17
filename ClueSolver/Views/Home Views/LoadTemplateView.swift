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
            Image("mansion2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 30)
                    .frame(maxWidth: .infinity)
                
                
                Button("Load Mock Game") {
                    navPath.append(Route.newGame(Game.mockGame()))
                }
                .buttonStyle(HomeButtonStyle())

                
                List {
                    ForEach(fetchedTemplates, id: \.id) { template in
                        Button(action: {
                            selectedTemplate = template
                        }) {
                            Text(template.name ?? "Unnamed Template")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Foreground").opacity(0.8))
                                .cornerRadius(10)
                                .foregroundColor(Color("MainText"))
                        }
                        .listRowBackground(Color.clear)
                    }
                    .onDelete(perform: deleteTemplate)
                }
                .padding(.bottom, 20)
                .scrollContentBackground(.hidden)
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
                    }
                    .padding()
                }
            }
        }
    }
    
    func deleteTemplate(at offsets: IndexSet) {
        for index in offsets {
            let template = fetchedTemplates[index]
            Model.shared.deleteTemplate(template)
        }
        fetchedTemplates.remove(atOffsets: offsets)
    }
    
}
