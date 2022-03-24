//
//  ViewController.swift
//  JogarDados
//
//  Created by Luciano Berchon on 09/02/22.
//

import UIKit

class ViewController: UIViewController, ConfiguracoesDelegate {
    
    // MARK: Atributos
    var valorMaximo = 6
    
    // MARK: Outlets
    @IBOutlet weak var numeroSorteado: UILabel!
    
    
    // MARK: Actions
    @IBAction func jogar(_ sender: Any) {
        let valorSorteado = sortearNumero(valorMaximo)

        numeroSorteado.text = String(valorSorteado)
    }
    
    
    // MARK: Métodos
    func trocarDado(porOutroCom valorMaximo: Int) {
        self.valorMaximo = valorMaximo
    }
    
    func PegaNumeroDeLadosDoDadoAtual() -> Int {
        return valorMaximo
    }
    
    func sortearNumero(_ valorMaximo: Int) -> Int {
        return Int.random(in: 1...valorMaximo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "configuracoes" {
            if let configuracoesViewController = segue.destination as? ConfigurationViewController {
                configuracoesViewController.delegate = self
            }
        }
    }
    
    
    // MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
