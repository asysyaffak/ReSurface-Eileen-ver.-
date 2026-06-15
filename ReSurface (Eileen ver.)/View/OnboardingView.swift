//
//  ContentView.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 29/04/26.
//

import SwiftUI

struct OnboardingView: View {
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("onboarding")
                .resizable()
                .ignoresSafeArea()
            Button {
                gameState.screen = .selectPlayer
            } label: {
                Text("Let's Go")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
            }
            .buttonStyle(.glassProminent)
            .padding(.top, 240)
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
    OnboardingView(gameState: GameState())
}
