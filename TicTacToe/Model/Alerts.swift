//
//  Alerts.swift
//  TicTacToe
//
//  Created by Mehrdad Jafarzadeh on 6.11.2021.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    
    static let humanWins    = AlertItem(title: Text("You win!"),
                                        message: Text("You are so smart"),
                                        buttonTitle: Text("Beat again!"))
    
    static let computerWins = AlertItem(title: Text("Computer win!"),
                                        message: Text("You programmed a super smart AI"),
                                        buttonTitle: Text("Rematch"))
    
    static let draw         = AlertItem(title: Text("Draw!"),
                                        message: Text("what a battle we have here!"),
                                        buttonTitle: Text("Try Again"))
    
    static let finish       = AlertItem(title: Text("Finished"),
                                        message: Text("The match finished let's play another Round"),
                                        buttonTitle: Text("Set a New game"))
}
