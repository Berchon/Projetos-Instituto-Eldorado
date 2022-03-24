//
//  Cargo.swift
//  SistemaEscola
//
//  Created by Luciano Berchon on 16/02/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

enum Cargo {
    case monitor
    case professor
    case coordenador
    case diretor
    case assistente
    
    func nomeFormal() -> String {
        switch self {
        case .monitor:
            return "Monitor"
        case .professor:
            return "Professor"
        case .coordenador:
            return "Coordenador"
        case .diretor:
            return "Diretor"
        case .assistente:
            return "Assistente"
        }
    }
    
    func abreviado() -> String {
        switch self {
        case .monitor:
            return "Mntr."
        case .professor:
            return "Prof."
        case .coordenador:
            return "Coord."
        case .diretor:
            return "Dir."
        case .assistente:
            return "Asst."
        }
    }
}
