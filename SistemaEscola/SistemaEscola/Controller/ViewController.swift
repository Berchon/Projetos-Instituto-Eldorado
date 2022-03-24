//
//  ViewController.swift
//  SistemaEscola
//
//  Created by Renan Trévia on 2/11/22.
//  Copyright © 2022 Eldorado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: Variables
    var cargoSelecionado: Cargo = .monitor
    var ultimaMatricula = 0
    var colaboradores: [Colaborador] = []
    
    // MARK: - Outlets
    @IBOutlet weak var outputMessage: UILabel!
    
    @IBOutlet weak var matriculaTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var salarioTextField: UITextField!
    
    @IBOutlet weak var monitorButton: UIButton!
    @IBOutlet weak var professorButton: UIButton!
    @IBOutlet weak var coordenadorButton: UIButton!
    @IBOutlet weak var diretorButton: UIButton!
    @IBOutlet weak var assistenteButton: UIButton!
    
    @IBOutlet weak var removeMatriculaTextField: UITextField!
    
    // MARK: IBActions
    @IBAction func selecionaMonitor(_ sender: UIButton) {
        cargoSelecionado = .monitor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaProfessor(_ sender: UIButton) {
        cargoSelecionado = .professor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaCoordenador(_ sender: UIButton) {
        cargoSelecionado = .coordenador
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaDiretor(_ sender: UIButton) {
        cargoSelecionado = .diretor
        selecionaBotao(botao: sender)
    }
    
    @IBAction func selecionaAssistente(_ sender: UIButton) {
        cargoSelecionado = .assistente
        selecionaBotao(botao: sender)
    }
    
    @IBAction func cadastrarColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 1 Aqui!
        guard let nome = nomeTextField.text else {return}
        ultimaMatricula += 1
        let matricula = String(ultimaMatricula)
        guard
            let salario = salarioTextField.text,
            let salario = Double(salario)
        else {
            return
        }
        
        let colaborador = Colaborador(nome: nome, matricula: matricula, salario: salario, cargo: cargoSelecionado)
        adicionaColaborador(colaborador)

        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaCadastraColaborador()
    }
    
    @IBAction func removerColaborador(_ sender: UIButton) {
        // TODO: Inserir Feature 2 Aqui!
        guard let matricula = removeMatriculaTextField.text else {return}
        if removeColaborador(comMatrícula: matricula) {
            outputMessage.text = listaColaboradoresEmOrdemAlfabetica()
        }
        else {
            outputMessage.text = "Não foi possível remover o colaborador com a matrícula número \(matricula)"
        }
        
        // Importante deixar essa função como última porque ela reseta o sistema por estado inicial.
        resetaRemoveColaborador()
    }
    
    @IBAction func listarGastosMensaisComTodosColaboradores(_ sender: UIButton) {
        // TODO: Inserir Feature 3 Aqui!
        outputMessage.text = "Os gastos mensais com folha de pagamento é R$ \(listaGastoMensais())"
    }
    
    @IBAction func listarGastosMensaisPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 4 Aqui!
        outputMessage.text = listaGasto(doCargo: cargoSelecionado)
    }
    
    @IBAction func listarQuantasPessoasExistemPorCargo(_ sender: UIButton) {
        // TODO: Inserir Feature 5 Aqui!
         outputMessage.text = listaQuantidadeDeColaboradores(doCargo: cargoSelecionado)
    }
    
    @IBAction func listarNomesColaboradoresOrdemAlfabetica(_ sender: UIButton) {
        // TODO: Inserir Feature 6 Aqui!
        outputMessage.text = listaColaboradoresEmOrdemAlfabetica()
    }
    
    // MARK: Methods
    
    func adicionaColaborador(_ colaborador: Colaborador) {
        if let diretor = colaboradores.first(where: {$0.cargo == .diretor}) {
            if colaborador.cargo == .diretor {
                outputMessage.text = "Esta escola já possui um DIRETOR"
                return
            }
            
            if diretor.salario <= colaborador.salario {
                outputMessage.text = "Não é possível adicionar colaborador \(colaborador.nome) com salário maior que o do DIRETOR"
                return
            }
        }
        
        if colaborador.cargo == .coordenador &&
            quantidadeDeColaboradores(doCargo: .coordenador) >= quantidadeDeColaboradores(doCargo: .professor) {
            outputMessage.text = "ESCOLA não pode ter mais COORDENADORES do que PROFESSORES."
            return
        }
        
        colaboradores.append(colaborador)
        outputMessage.text = listaColaboradoresEmOrdemAlfabetica()
    }

    func removeColaborador(comMatrícula matricula: String) -> Bool {
        if let index = colaboradores.firstIndex(where: { $0.matricula == matricula }) {
            colaboradores.remove(at: index)
            return true
        }

        return false
    }

    func listaGastoMensais() -> Double {
        return colaboradores.reduce(0, {$0 + $1.salario})
    }
    
    func listaGasto(doCargo cargo: Cargo) -> String {
        let gastoTotal: Double = colaboradores.filter({$0.cargo == cargo}).reduce(0, {$0 + $1.salario})

        return "Os gastos com o cargo \(cargo.nomeFormal()) são de R$ \(gastoTotal)."
    }

    func quantidadeDeColaboradores(doCargo cargo: Cargo) -> Int {
        return colaboradores.filter{ $0.cargo == cargo }.count
    }
    
    func listaQuantidadeDeColaboradores(doCargo cargo: Cargo) -> String {
        return "Existe(m) \(quantidadeDeColaboradores(doCargo: cargo)) colaborador(es) do cargo \(cargo.nomeFormal())."
    }
    
    func listaColaboradoresEmOrdemAlfabetica() -> String {
        return colaboradores.map{ $0.nome }.sorted().joined(separator: ", ")
    }
    
}

