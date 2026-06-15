//
//  QuestionBank.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 12/06/26.
//

import Foundation

enum QuestionBank {
     static let level1: [Question] = [
         Question(
            text: "Apa hal kecil yang membuatmu bahagia minggu ini?",
            level: 1,
            point: 10
        ),
         Question(
            text: "Apa aktivitas favoritmu saat sedang penat?",
            level: 1,
            point: 10
        ),
        Question(
            text: "Siapa orang yang paling membuatmu nyaman saat ini?",
            level: 1,
            point: 10
        ),
        Question(
            text: "Apa hal yang sedang kamu nantikan saat ini?",
            level: 1,
            point: 10
        ),
        Question(
            text: "Apa kebiasaan yang sedang berusaha kamu ubah?",
            level: 1,
            point: 10
        )
    ]

    static let level2: [Question] = [
        Question(
            text: "Apa ketakutan yang sering kamu sembunyikan?",
            level: 2,
            point: 20
        ),
        Question(
            text: "Kapan terakhir kali kamu merasa benar-benar bangga pada dirimu sendiri?",
            level: 2,
            point: 20
        ),
        Question(
            text: "Apa hal yang sering membuatmu overthinking?",
            level: 2,
            point: 20
        ),
        Question(
            text: "Hal baik apa yang kamu sukai dari pemain setelahmu?",
            level: 2,
            point: 20
        ),
        Question(
            text: "Apa nasihat yang dulu tidak kamu sukai tapi sekarang kamu pahami?",
            level: 2,
            point: 20
        )
    ]

    static let level3: [Question] = [
        Question(
            text: "Apa pengalaman yang paling membentuk dirimu hari ini?",
            level: 3,
            point: 30
        ),
        Question(
            text: "Apa hal yang paling sulit kamu ceritakan ke orang lain?",
            level: 3,
            point: 30
        ),
        Question(
            text: "Apa ketakutan terbesar yang masih kamu bawa sampai sekarang?",
            level: 3,
            point: 30
        ),
        Question(
            text: "Jika bisa mengatakan satu hal kepada dirimu lima tahun yang lalu, apa yang akan kamu katakan?",
            level: 3,
            point: 30
        ),
        Question(
            text: "Apa hal yang selama ini ingin kamu dengar dari seseorang tetapi belum pernah kamu dengar?",
            level: 3,
            point: 30
        )
    ]
}
