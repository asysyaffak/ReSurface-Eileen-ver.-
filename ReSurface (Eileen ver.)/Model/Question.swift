//
//  Question.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 12/06/26.
//

import Foundation

struct Question: Identifiable {
    let id = UUID()
    let text: String
    let level: Int
    let point: Int
}
