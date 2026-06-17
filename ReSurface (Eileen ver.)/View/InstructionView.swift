//
//  SelectPlayer.swift
//  ReSurface (Eileen ver.)
//
//  Created by Asy Syaffa Khoirunnisa on 04/06/26.
//

import SwiftUI

struct InstructionView: View {
    var body: some View {
        ZStack {
            Image("instruction")
                .resizable()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    InstructionView()
}
