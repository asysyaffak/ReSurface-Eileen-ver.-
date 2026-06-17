//
//  Finished.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import SwiftUI

struct CompletedView: View {
    @Environment(Router.self) var router
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("completed")
                .resizable()
                .ignoresSafeArea()
            VStack (spacing: 120) {
                VStack (spacing: 24) {
                    Text("Congratulations!")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.appTitle)
                    Text("Mission complete! You all crushed those challenges.")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.appTitle)
                        .padding(.horizontal, 60)
                }
                VStack (spacing: 9) {
                    Button {
                        router.push(.statisticCompleted)
                    } label: {
                        Text("View Statistics")
                            .font(.title3)
                            .fontWeight(.medium)
                            .padding(8)
                    }
                    .buttonStyle(.glassProminent)
                    Button {
                        gameState.resetGame()
                        router.push(.selectPlayer)
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
    CompletedView(gameState: GameState())
}
