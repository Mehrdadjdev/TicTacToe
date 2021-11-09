//
//  Player.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 6.11.2021.
//

import Foundation

enum Player {
    case human, computer
}

struct Move {
    var player: Player
    var boardIndex: Int
    
    var indicator: String {
        return player == .human ? "xmark" : "circle"
    }
}
