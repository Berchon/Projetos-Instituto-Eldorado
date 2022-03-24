//
//  Sign.swift
//  PedraPapelTesouraLagartoSpock
//
//  Created by Luciano Berchon on 25/02/22.
//

import Foundation
import CoreText

func randomSign() -> Sign {
    let sign = Int.random(in: 0...4)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else if sign == 2 {
        return .scissors
    } else if sign == 3 {
        return .lizard
    } else {
        return .spock
    }
}

enum Sign {
    case rock
    case paper
    case scissors
    case lizard
    case spock
    
    var emoji: String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .scissors:
            return "✌️"
        case .lizard:
            return "🤏"
        case .spock:
            return "🖖"
        }
    }
    
    func gameState(against opponentSign: Sign) -> GameState {
        if opponentSign == self {
            return .draw
        }
        
        switch self {
        case .rock:
            if opponentSign == .scissors || opponentSign == .lizard {
                return .win
            }
        case .paper:
            if opponentSign == .spock || opponentSign == .rock {
                return .win
            }
        case .scissors:
            if opponentSign == .lizard || opponentSign == .paper {
                return .win
            }
        case .lizard:
            if opponentSign == .paper || opponentSign == .spock {
                return .win
            }
        case .spock:
            if opponentSign == .rock || opponentSign == .scissors {
                return .win
            }
        }
        
        return .lose
    }
}
