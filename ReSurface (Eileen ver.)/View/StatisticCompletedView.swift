//
//  StatisticView.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 12/06/26.
//

import SwiftUI

struct StatisticCompletedView: View {
    @Environment(Router.self) var router
    @Bindable var gameState: GameState
    var body: some View {
        ZStack {
            Image("statisticCompleted")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Text("Statistics")
                    .font(.largeTitle.bold())
                    .foregroundStyle(Color.appTitle)
                VStack {
                    ForEach(Array(gameState.players.enumerated()), id: \.element.id) { index, player in
                        VStack {
                            HStack(spacing: 20) {
                                Image("avatar")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                VStack(alignment: .leading) {
                                    Text(player.name)
                                        .font(.body)
                                        .foregroundStyle(Color.appTitle)
                                    Text("Player \(index + 1)")
                                        .font(.subheadline)
                                        .foregroundStyle(Color("captionColor"))
                                }
                                Spacer()
                                Text("\(player.score) \(player.score <= 1 ? "Point" : "Points")")
                                    .font(.body)
                                    .foregroundStyle(Color("captionColor"))
                            }
                            if index < gameState.players.count - 1 {
                                Divider()
                            }
                        }
                    }
                }
                .padding(.horizontal, 40)
                .padding(.vertical, 25)
                .frame(maxWidth: .infinity, minHeight: 180)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 25))
            }
            .padding()
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

#Preview {
    let gameState = GameState()
    gameState.players = [
        Player(name: "Acaci", score: 20),
        Player(name: "Akpali", score: 0),
        Player(name: "Ayah", score: 80),
        Player(name: "Ibu", score: 60)
    ]
    return StatisticCompletedView(
        gameState: gameState
    )
}

