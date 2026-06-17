//
//  SelectedCard.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import SwiftUI

struct SelectedCardView: View {
    @Environment(Router.self) var router
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            switch gameState.elaborateState {
            case 3:
                Color.background1
                    .ignoresSafeArea()
            case 2:
                Color.background2
                    .ignoresSafeArea()
            case 1:
                Color.background3
                    .ignoresSafeArea()
            case 0:
                Color.background4
                    .ignoresSafeArea()
            default:
                Color.background1
                    .ignoresSafeArea()
            }
            VStack(spacing : 40) {
                Spacer()
                switch gameState.elaborateState {
                case 3:
                    Text("\nYou selected…")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.appTitle)
                case 2:
                    Text("\nTell us more!")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.appTitle2)
                case 1:
                    Text("\nGo a bit deeper?")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.appTitle2)
                case 0:
                    Text("Last one, \n make it count!")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.appTitle2)
                        .multilineTextAlignment(.center)
                default:
                    Text("\nYou selected…")
                        .font(.largeTitle.bold())
                        .foregroundStyle(Color.appTitle)
                }
                VStack (spacing: 16) {
                    Text("Level \(gameState.selectedLevel ?? 0)")
                        .font(.callout)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.appTitle)
                    Text("\(gameState.currentQuestion?.text ?? "Question")")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.appTitle)
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal)
                .frame(maxWidth: 280, maxHeight: 360)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 8,
                    x: 0,
                    y: 4)
                Spacer()
                HStack {
                    VStack {
                        Button {
                            gameState.elaborate()
                        } label: {
                            Text("Elaborate")
                                .font(.body)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.glassProminent)
                        .disabled(gameState.elaborateState < 1)
                        if gameState.elaborateState == 3 {
                            Text("Limit: \(gameState.elaborateState)")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.appTitle)
                        } else {
                            Text("Limit: \(gameState.elaborateState)")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.appTitle2)
                        }
                    }
                    VStack {
                        Image("avatar")
                            .resizable()
                            .frame(width: 80, height: 80)
                        Text(gameState.currentPlayer?.name ?? "Player")
                            .font(.body)
                            .fontWeight(.medium)
                    }
                    VStack {
                        Button {
                            gameState.finishQuestion()
                            gameState.nextTurn()
                            if gameState.totalScore >= gameState.targetScore {
                                router.push(.completed)
                            } else {
                                router.push(.mainGame)
                            }
                        } label: {
                            Text("Continue")
                                .font(.body)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                        }
                        .buttonStyle(.glass)
                    }
                    .padding(.bottom, 32)
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
    SelectedCardView(gameState: GameState())
}
