//
//  GameSquareView.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 6.11.2021.
//

import SwiftUI

struct GameSquareView: View {
    
    var proxy: GeometryProxy
    
    var body: some View {
        Circle()
            .foregroundColor(.red).opacity(0.7)
            .frame(width: proxy.size.width/3 - 15,
                   height: proxy.size.width/3 - 15)
    }
}


//struct GameSquareView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameSquareView(proxy: <#GeometryProxy#>)
//    }
//}
