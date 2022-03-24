//
//  configurationsController.swift
//  JogarDados
//
//  Created by Luciano Berchon on 09/02/22.
//

import Foundation
import UIKit

protocol ConfiguracoesDelegate {
    func trocarDado(porOutroCom valorMaximo: Int)
    func PegaNumeroDeLadosDoDadoAtual() -> Int
}

class ConfigurationViewController: UIViewController {
    
    // MARK: Atributos
    var delegate: ConfiguracoesDelegate?

    
    // MARK: Outlets
    @IBOutlet weak var numeroDeLadosDoDado: UITextField?
    
    
    // MARK: Actions
    
    @IBAction func aplicar(_ sender: Any) {
        guard let numeroDeLados = numeroDeLadosDoDado?.text else {
            print("Digite o número de lados do dado")
            return
        }
        
        guard let numero = Int(numeroDeLados) else {
            print("Digite um número inteiro válido")
            return
        }
        
        if numero <= 1 {
            print("O número de lados deve ser maior que 1.")
            return
        }
        
        delegate?.trocarDado(porOutroCom: numero)
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let numeroDeLados = delegate?.PegaNumeroDeLadosDoDadoAtual() {
            numeroDeLadosDoDado?.text = String(numeroDeLados)
        }
    }
}
