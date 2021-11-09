//
//  MainButtonView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 7.11.2021.
//

import SwiftUI


struct MainButtonView: View {
    
    var action: () -> Void
    var title: String
    
    var body: some View {
        Button(title, action: action)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 300, height: 50)
            .background(Color.green)
            .cornerRadius(15.0)
    }
}
