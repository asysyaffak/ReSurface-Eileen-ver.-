//
//  StatisticView.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 12/06/26.
//

import Foundation
import Observation

enum Screen {
    case onboarding
    case instruction
    case statistic
    case selectPlayer
    case mainGame
    case selectCard
    case question
    case completed
    case statisticCompleted
}

@Observable
class GameState {
    // MARK: Screen
    var screen: Screen = .onboarding
    var previousScreen: Screen?
    func navigate(to newScreen: Screen) {
        previousScreen = screen
        screen = newScreen
    }
    func goBack() {
        guard let previousScreen else {
            return
        }
        screen = previousScreen
    }
    // MARK: Player
    var players: [Player] = []
    var names = ["", "", "", ""]
    var currentPlayerIndex = 0
    var validPlayerCount: Int {
        names.filter {
            !$0.trimmingCharacters(
                in: .whitespacesAndNewlines
            ).isEmpty
        }
        .count
    }
    var currentPlayer: Player? {
        guard !players.isEmpty else {
            return nil
        }
        return players[currentPlayerIndex]
    }
    func startGame(names: [String]) {
        players = names.map {
            Player(name: $0)
        }
        currentPlayerIndex = 0
        screen = .mainGame
    }
    func nextTurn() {
        if totalScore >= targetScore {
            screen = .completed
            return
        }
        currentPlayerIndex = (currentPlayerIndex + 1) % players.count
        selectedLevel = nil
        currentQuestion = nil
    }
    func resetGame() {
        names = ["", "", "", ""]
    }
    // MARK: Score
    let targetScore = 100
    var totalScore: Int {
        players.reduce(0) {
            $0 + $1.score
        }
    }
    // MARK: Level & Question
    var selectedLevel: Int?
    var currentQuestion: Question?
    func selectLevel(_ level: Int) {
        selectedLevel = level
        switch level {
        case 1:
            currentQuestion =
            QuestionBank.level1.randomElement()
        case 2:
            currentQuestion =
            QuestionBank.level2.randomElement()
        case 3:
            currentQuestion =
            QuestionBank.level3.randomElement()
        default:
            break
        }
        screen = .question
    }
    func finishQuestion() {
        guard let level = selectedLevel else {
            return
        }
        let points: Int
        switch level {
        case 1:
            points = 10
        case 2:
            points = 20
        case 3:
            points = 30
        default:
            points = 0
        }
        players[currentPlayerIndex].score += points
        screen = .mainGame
    }
    // MARK: Elaborate
    var elaborateState = 3
    func elaborate() {
            elaborateState -= 1
        }
    func resetElaborate() {
            elaborateState = 3
        }
}
