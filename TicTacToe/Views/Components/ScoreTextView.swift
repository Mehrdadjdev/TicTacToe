//
//  ScoreTextView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 8.11.2021.
//

import SwiftUI

struct ScoreTextView: View {
    
    var scoreText: String
    
    var body: some View {
        Text(scoreText)
            .padding()
            .background(Color.yellow)
            .clipShape(Capsule())
            .overlay(
                Capsule().stroke(Color.green, lineWidth: 2)
            )
    }
}

