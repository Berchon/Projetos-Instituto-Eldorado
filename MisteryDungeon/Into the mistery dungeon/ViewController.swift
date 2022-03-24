//
//  ViewController.swift
//  Into the mistery dungeon
//
//  Created by Mariana Beilune Abad on 08/02/22.
//  Implemented by Luciano Berchon on 10/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Atributos
    var monster = false
    var trap = false
//    let mensagem = "Tocou no botão para "
    var direcao = ""
    
    // MARK: Outlet
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var actions: UILabel!
    
    // MARK: Actions
    @IBAction func touchedUpButton(_ sender: Any) {
        direcao = "cima"
        walk(to: direcao)
    }
    
    @IBAction func touchedRightButton(_ sender: Any) {
        direcao = "direita"
        walk(to: direcao)
    }
    
    @IBAction func touchedDownButton(_ sender: Any) {
        direcao = "baixo"
        walk(to: direcao)
    }
    
    @IBAction func touchedLeftButton(_ sender: Any) {
        direcao = "esquerda"
        walk(to: direcao)
    }
    
    @IBAction func attack(_ sender: Any) {
        if monster {
            actions.text = "IÁÁÁÁÁÁÁÁ"
            monster = false
            Alerta(controller: self).exibe(mensagem: "Você atacou o monstro")
            print("Você atacou o monstro")
            changeEvent(imageNamed: "road", actionText: "Ufa, podemos andar novamente.")
            return
        }
        
        Alerta(controller: self).exibe(mensagem: "Não há monstros aqui!")
        print("Não há monstros aqui!")
    }
    
    @IBAction func disableTrap(_ sender: Any) {
        if trap {
            actions.text = "É nóis....Essa eu consigo desarmar!"
            trap = false
            Alerta(controller: self).exibe(mensagem: "Você desarmou a armadilha!")
            print("Você desarmou a armadilha!")
            changeEvent(imageNamed: "road", actionText: "Ufa, podemos andar novamente.")
            return
        }
        
        Alerta(controller: self).exibe(mensagem: "Não há armadilhas aqui!")
        print("Não há armadilhas aqui!")
    }
    
    // MARK: Ciclo de vida
    override func viewDidLoad() {
        super.viewDidLoad()
        randomEvent()
    }
    
    // MARK: Métodos
    func walk(to direction: String) {
        if monster == true {
            Alerta(controller: self).exibe(mensagem: "Você deve matar o mostro antes de continuar")
            print("Você deve matar o mostro antes de continuar")
        } else if trap == true {
            Alerta(controller: self).exibe(mensagem: "Você deve desarmar a armadilha antes de continuar")
            print("Você deve desarmar a armadilha antes de continuar")
        } else {
            Alerta(controller: self).exibe(mensagem: "Você pode andar livremente para \(direcao)")
            print("Você pode andar livremente para \(direcao)")
            randomEvent()
        }
    }
    
    func randomEvent() {
        let numberEvent = Int.random(in: 0...2)
        
        if numberEvent == 0 {
            monster = true
            Alerta(controller: self).exibe(mensagem: "Cuidado, há um monstro a frente.")
            print("Cuidado, há um monstro a frente.")
            changeEvent(imageNamed: "cthulhu", actionText: "Teremos que matar o mostro para avançar")
        } else if numberEvent == 1 {
            trap = true
            Alerta(controller: self).exibe(mensagem: "Cuidado, há uma armadilha a frente.")
            print("Cuidado, há uma armadilha a frente.")
            changeEvent(imageNamed: "trap", actionText: "Devemos desarmar a armadilha para avançar")
        } else {
            Alerta(controller: self).exibe(mensagem: "O caminho está livre, podemos continuar")
            print("O caminho está livre, podemos continuar")
            changeEvent(imageNamed: "road", actionText: "Podemos andar sem problemas.")
        }
    }
    
    func changeEvent(imageNamed: String, actionText: String) {
        eventImage.image = UIImage(named: imageNamed)
        actions.text = actionText
    }
}

