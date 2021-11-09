//
//  ContentView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 6.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue],
                           startPoint: .top,
                           endPoint: .bottom)
                .ignoresSafeArea()
            
            if viewModel.gameStart {
                
                GameView(viewModel: self.viewModel)
                
            } else {
                GeometryReader { geo in
                    VStack {
                        TitleView(title: "Tic Tac Toe")
                        TitleImageView(imageName: "pngegg", proxy: geo)
                        TextInputView(title: $viewModel.playerName)
                        
                        Spacer()
                        
                        MainPickerView(title: "Difficulty",
                                       arrayRange: viewModel.difficulties,
                                       selection: $viewModel.difficulty)
                        
                        Spacer()
                        
                        MainButtonView(action: viewModel.startGame,
                                       title: "Start Game")
                        
                        Spacer()
                    }
                }
                
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



