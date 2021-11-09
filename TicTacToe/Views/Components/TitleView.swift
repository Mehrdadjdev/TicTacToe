//
//  TitleView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 7.11.2021.
//

import SwiftUI

struct TitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding([.top, .bottom], 50)
    }
}
