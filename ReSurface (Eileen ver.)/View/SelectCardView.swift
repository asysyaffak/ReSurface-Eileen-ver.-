//
//  SelectCard.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import SwiftUI

struct SelectCardView: View {
    @Environment(Router.self) var router
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Color.background1
                .ignoresSafeArea()
            VStack() {
                Text("\nYour turn!")
                    .font(.title2.bold())
                    .foregroundStyle(Color.appTitle)
                Text("Select a card")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.appTitle)
                Spacer()
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 16
                ) {
                    ForEach(0..<3, id: \.self) { index in
                        LevelCardView(level: "\(index + 1)")
                            .onTapGesture {
                                gameState.selectLevel(index + 1)
                                gameState.resetElaborate()
                                router.push(.question)
                            }
                    }
                }
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 8,
                    x: 0,
                    y: 4)
                .padding(.horizontal)
                Spacer()
                Image("avatar")
                    .resizable()
                    .frame(width: 80, height: 80)
                Text(gameState.currentPlayer?.name ?? "Player")
                    .font(.body)
                    .fontWeight(.medium)
            }
            .padding(.vertical)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    router.push(.instruction)
                } label: {
                    Image(systemName: "questionmark")
                }
            }
        }
    }
}

struct LevelCardView: View {
    let level: String
    var body: some View {
        VStack {
            Text(level)
                .font(.largeTitle.bold())
                .foregroundStyle(Color.appTitle)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 180)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {

    let gameState = GameState()
    gameState.players = [
        Player(name: "Ibu"),
        Player(name: "Ayah")
    ]
    return SelectCardView(gameState: gameState)
}
