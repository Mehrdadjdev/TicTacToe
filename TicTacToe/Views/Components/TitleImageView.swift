//
//  TitleImageView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 7.11.2021.
//

import SwiftUI

struct TitleImageView: View {
    
    var imageName: String
    var proxy: GeometryProxy
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: proxy.size.width / 2, height: proxy.size.width / 2)
            .padding(.bottom, 50)
    }
}
