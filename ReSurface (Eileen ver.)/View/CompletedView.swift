//
//  Finished.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import SwiftUI

struct CompletedView: View {
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("completed")
                .resizable()
                .ignoresSafeArea()
            VStack (spacing: 120) {
                VStack (spacing: 24) {
                    Text("Congratulations!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(Color("titleColor"))
                    Text("Mission complete! You all crushed those challenges.")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(Color("titleColor"))
                        .padding(.horizontal, 60)
                }
                VStack (spacing: 9) {
                    Button {
                        gameState.screen = .statisticCompleted
                    } label: {
                        Text("View Statistics")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(8)
                    }
                    .buttonStyle(.glassProminent)
                    Button {
                        gameState.resetGame()
                        gameState.screen = .selectPlayer
                    } label: {
                        Text("Play Again")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(8)
                    }
                    .buttonStyle(.glass)
                }
            }
        }
        .toolbar {
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
    CompletedView(gameState: GameState())
}
