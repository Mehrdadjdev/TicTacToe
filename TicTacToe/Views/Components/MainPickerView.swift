//
//  MainPickerView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 7.11.2021.
//

import SwiftUI

struct MainPickerView: View {
    
    var title: String
    var arrayRange: [String]
    @Binding var selection: String
    
    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(arrayRange, id: \.self) {
                Text($0)
            }
        }
        .padding()
        .pickerStyle(.segmented)
    }
}
