//
//  SelectPlayer.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 04/06/26.
//

import SwiftUI

struct SelectPlayerView: View {
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("selectPlayer")
                .resizable()
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                Text("Enter Player")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(Color("titleColor"))
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 16
                ) {
                    ForEach(0..<4, id: \.self) { index in

                        PlayerCard(
                            title: "Player \(index + 1)",
                            name: $gameState.names[index]
                        )
                    }
                }
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 8,
                    x: 0,
                    y: 4)
                .padding(.horizontal)
                
                Button {
                    let filteredNames = gameState.names.filter {
                        !$0.isEmpty
                    }
                    gameState.startGame(
                        names: filteredNames
                    )
                } label: {
                    Text("Let's Go")
                        .font(.title2)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.glassProminent)
                .disabled(gameState.validPlayerCount < 2)
            }
            .padding(40)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    gameState.screen = .onboarding
                } label: {
                    Image(systemName: "chevron.backward")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    gameState.navigate(
                        to: .instruction
                    )
                } label: {
                    Image(systemName: "questionmark")
                }
            }
        }
    }
}

struct PlayerCard: View {
    let title: String
    @Binding var name: String
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .frame(width: 80, height: 80)
            Spacer()
            Text(title)
                .font(.caption)
                .foregroundStyle(Color.secondary)
            ZStack {
                if name.isEmpty {
                    Text("Enter name")
                        .font(.body)
                        .bold()
                        .foregroundStyle(Color("captionColor2"))
                }
                TextField("", text: $name)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color("titleColor"))
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 25))
    }
}

#Preview {
    SelectPlayerView( gameState: GameState())
}
