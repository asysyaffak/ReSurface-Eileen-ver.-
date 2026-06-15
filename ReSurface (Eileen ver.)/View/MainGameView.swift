//
//  MainGame.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import SwiftUI

struct MainGameView: View {
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("mainGame")
                .resizable()
                .ignoresSafeArea()
            VStack {
                VStack (spacing: 16) {
                    Text("\(gameState.totalScore)/\(gameState.targetScore)")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(Color("titleColor"))
                    ProgressView(value: Double(gameState.totalScore), total: Double(gameState.targetScore))
                        .padding(.horizontal, 120)
                    Text("You're off to a great start. Keep going!")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("titleColor"))
                        .padding(.horizontal, 120)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Button {
                    gameState.screen = .selectCard
                } label: {
                    Text("Let's Go")
                        .font(.title2)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }
                .buttonStyle(.glassProminent)
            }
            .padding(.top, 30)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    gameState.screen = .statistic
                } label: {
                    Image(systemName: "rectangle.stack")
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

#Preview {
    MainGameView(gameState: GameState())
}
