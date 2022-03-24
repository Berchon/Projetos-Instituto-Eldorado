//
//  Colaborador.swift
//  SistemaEscola
//
//  Created by Luciano Berchon on 16/02/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

struct Colaborador {
    let nome: String
    let matricula: String
    let salario: Double
    let cargo: Cargo
    
    func seApresentarFormal() -> String {
        return "Meu nome é \(nome), sou \(cargo.nomeFormal()) e minha matrícula é \(matricula)"
    }
    
    func seApresentarInformal() -> String {
        return "Eu sou \(cargo.abreviado()) \(nome)"
    }
}
