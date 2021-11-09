//
//  PlayerIndicatorView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 6.11.2021.
//

import SwiftUI

struct PlayerIndicatorView: View {
    
    var systemImageName: String
    
    var body: some View {
        Image(systemName: systemImageName)
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.white)
    }
}

struct PlayerIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerIndicatorView(systemImageName: "xmark")
    }
}
