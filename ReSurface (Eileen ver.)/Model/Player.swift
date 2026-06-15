//
//  Player.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 10/06/26.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    var name: String
    var score: Int = 0
}
