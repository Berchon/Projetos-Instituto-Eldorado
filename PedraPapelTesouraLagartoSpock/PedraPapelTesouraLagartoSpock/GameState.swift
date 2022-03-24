//
//  GameState.swift
//  PedraPapelTesouraLagartoSpock
//
//  Created by Luciano Berchon on 25/02/22.
//

import Foundation

enum GameState {
    case start
    case win
    case lose
    case draw
    
    var status: String {
        switch self {
        case .start:
            return "Pedra, Papel, Tesoura, Lagarto e Spock?"
        case .win:
            return "Você ganhou!"
        case .lose:
            return "Você perdeu!"
        case .draw:
            return "Você empatou!"
        }
    }
}
