//
//  GameView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 7.11.2021.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.purple, .blue],
                               startPoint: .top,
                               endPoint: .bottom)
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    
                    TitleView(title: "Tic Tac Toe")
                    
                    Spacer()
                    
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(0..<9) { i in
                            ZStack {
                                GameSquareView(proxy: geo)
                                
                                PlayerIndicatorView(systemImageName: viewModel.moves[i]?.indicator ?? "")
                            }
                            .onTapGesture {
                                viewModel.processPlayerMove(for: i)
                                
                            }
                        }
                    }
                    Spacer()
                    
                    ScoreTextView(scoreText: "\(viewModel.playerName): \(viewModel.humanScore)")
                        .padding(.top, 30)
                        
                    ScoreTextView(scoreText: "Computer: \(viewModel.computerScore)")
                    
                    ScoreTextView(scoreText: "Curret game: \(viewModel.currentGame)/\(viewModel.countOfGames)")
                    
                    Spacer()
                }
                .padding()
            }
            
        }
        .disabled(viewModel.isGameboardDisabled)
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: .default(alertItem.buttonTitle, action: {
                if viewModel.currentGame == viewModel.countOfGames + 1 {
                    viewModel.finishGame()
                }
                viewModel.resetGame()
                
                
            }))
        })
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(viewModel: GameViewModel())
    }
}


