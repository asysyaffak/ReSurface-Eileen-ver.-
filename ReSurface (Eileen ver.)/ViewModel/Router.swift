//
//  GameRouter.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 17/06/26.
//

import Foundation
import SwiftUI
import Combine

enum AppRoute: Hashable  {
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
final class Router {
    var path = NavigationPath()
    func push(_ route: AppRoute) {
        path.append(route)
    }
    func pop() {
        path.removeLast()
    }
    func popToRoot() {
        path.removeLast(path.count)
    }
}
