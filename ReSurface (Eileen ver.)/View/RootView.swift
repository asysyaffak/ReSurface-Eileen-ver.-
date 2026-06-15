//
//  RootView.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 12/06/26.
//

import Foundation
import SwiftUI

struct RootView: View {
    @State private var gameState = GameState()
    var body: some View {
        NavigationStack {
            switch gameState.screen {
            case .onboarding:
                OnboardingView(
                    gameState: gameState
                )
            case .instruction:
                InstructionView(
                    gameState: gameState
                )
            case .statistic:
                StatisticView(
                    gameState: gameState
                )
            case .selectPlayer:
                SelectPlayerView(
                    gameState: gameState
                )
            case .mainGame:
                MainGameView(
                    gameState: gameState
                )
            case .selectCard:
                SelectCardView(
                    gameState: gameState
                )
            case .question:
                SelectedCardView(
                    gameState: gameState
                )
            case .completed:
                CompletedView(
                    gameState: gameState
                )
            case .statisticCompleted:
                StatisticCompletedView(
                    gameState: gameState
                )
            }
            
        }
    }
}
