//
//  MainGame.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import SwiftUI

struct MainGameView: View {
    @Environment(Router.self) var router
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("mainGame")
                .resizable()
                .ignoresSafeArea()
            VStack {
                VStack (spacing: 16) {
                    Text("\(gameState.totalScore)/\(gameState.targetScore)")
                        .font(.title2.bold())
                        .foregroundStyle(Color.appTitle)
                    ProgressView(value: Double(gameState.totalScore), total: Double(gameState.targetScore))
                        .padding(.horizontal, 120)
                    Text("You're off to a great start. Keep going!")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.appTitle)
                        .padding(.horizontal, 120)
                        .multilineTextAlignment(.center)
                }
                Spacer()
                Button {
                    router.push(.selectCard)
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
                    router.push(.statistic)
                } label: {
                    Image(systemName: "rectangle.stack")
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    router.push(.instruction)
                } label: {
                    Image(systemName: "questionmark")
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MainGameView(gameState: GameState())
}
