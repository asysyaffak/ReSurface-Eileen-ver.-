//
//  RootView.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 12/06/26.
//

import Foundation
import SwiftUI

struct RootView: View {
    @State private var router = Router()
    @State private var gameState = GameState()
    var body: some View {
        NavigationStack (path: $router.path) {
            OnboardingView()
                .navigationDestination (for: AppRoute.self) { route in
                    switch route {
                    case .onboarding:
                        OnboardingView()
                    case .instruction:
                        InstructionView()
                    case .statistic:
                        StatisticView(gameState: gameState)
                    case .selectPlayer:
                        SelectPlayerView(gameState: gameState)
                    case .mainGame:
                        MainGameView(gameState: gameState)
                    case .selectCard:
                        SelectCardView(gameState: gameState)
                    case .question:
                        SelectedCardView(gameState: gameState)
                    case .completed:
                        CompletedView(gameState: gameState)
                    case .statisticCompleted:
                        StatisticCompletedView(gameState: gameState)
                    }
                }
        }
        .environment(router)
    }
}

