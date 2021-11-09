//
//  TextInputView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 7.11.2021.
//

import SwiftUI

struct TextInputView: View {
    
    @Binding private(set) var title: String
    
    var body: some View {
        TextField("Name", text: $title)
            .padding()
            .background(Color.white)
            .cornerRadius(20.0)
            .padding([.leading, .trailing], 27.5)
            .foregroundColor(.black)
    }
}
