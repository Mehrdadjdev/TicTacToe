//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 6.11.2021.
//

import SwiftUI

final class GameViewModel: ObservableObject {
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),]
    
    let difficulties = ["Easy", "Medium", "Hard"]
    let variantsOfGames = [5, 10, 20, 30]
    
    @Published var difficulty = "Medium"
    @Published var moves: [Move?] = Array(repeating: nil, count: 9)
    @Published var isGameboardDisabled = false
    @Published var alertItem: AlertItem?
    @Published var playerName = ""
    @Published var gameStart = false
    @Published var currentGame = 1
    @Published var humanScore = 0
    @Published var computerScore = 0
    @Published var countOfGames = 3
    
    func startGame() {
        self.gameStart.toggle()
    }
    
    func finishGame() {
        self.gameStart.toggle()
        currentGame = 1
        humanScore = 0
        computerScore = 0
    }
    
    func processPlayerMove(for position: Int) {
        
        //human move process
        if isSquareOccupied(in: moves, forIndex: position) { return }
        
        moves[position] = Move(player: .human, boardIndex: position)
        
        if checkWinCondition(for: .human, in: moves) {
            alertItem = AlertContext.humanWins
            humanScore += 1
            currentGame += 1
            return
        }
        
        if checkForDraw(in: moves) {
            alertItem = AlertContext.draw
            currentGame += 1
            return
        }
        
        isGameboardDisabled = true
        
        // computer move process
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [self] in
            let computerPosition = determineComputerMovePosition(in: moves)
            moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
            isGameboardDisabled = false
            if checkWinCondition(for: .computer, in: moves) {
                alertItem = AlertContext.computerWins
                computerScore += 1
                currentGame += 1
                return
            }
            if checkForDraw(in: moves) {
                alertItem = AlertContext.draw
                currentGame += 1
                return
            }
        }
    }
    
    func isSquareOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: { $0?.boardIndex == index})
    }
    
    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        
        //if AI can win, then win
        if difficulty == "Hard" {
            let computerMoves = moves.compactMap { $0 }.filter { $0.player == .computer }
            let computerPosition = Set(computerMoves.map { $0.boardIndex })
            
            for pattern in winPatterns {
                let winPositions = pattern.subtracting(computerPosition)
                if winPositions.count == 1 {
                    let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                    if isAvailable {
                        return winPositions.first!
                    }
                }
            }
        }
        
        //if AI can't win, then block
        
        if difficulty == "Hard" || difficulty == "Medium" {
            let humanMoves = moves.compactMap { $0 }.filter { $0.player == .human }
            let humanPosition = Set(humanMoves.map { $0.boardIndex })
            
            for pattern in winPatterns {
                let winPositions = pattern.subtracting(humanPosition)
                if winPositions.count == 1 {
                    let isAvailable = !isSquareOccupied(in: moves, forIndex: winPositions.first!)
                    if isAvailable {
                        return winPositions.first!
                    }
                }
            }
        }
        
        
        //if AI can't block, then take middle spot
        if !isSquareOccupied(in: moves, forIndex: 4) {
            return 4
        }
        
        //if AI can't take middle, then random availble
        var movePosition = Int.random(in: 0..<9)
        
        while isSquareOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }
    
    func checkWinCondition(for player: Player, in moves: [Move?]) -> Bool {
        let winPatterns: Set<Set<Int>> = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
        
        let playerMoves = moves.compactMap { $0 }.filter { $0.player == player }
        let playerPosition = Set(playerMoves.map { $0.boardIndex })
        
        for pattern in winPatterns where pattern.isSubset(of: playerPosition) { return true }
        
        return false
    }
    
    func checkForDraw(in moves: [Move?]) -> Bool {
        return moves.compactMap { $0 }.count == 9
    }
    
    func resetGame() {
        moves = Array(repeating: nil, count: 9)
    }
}
