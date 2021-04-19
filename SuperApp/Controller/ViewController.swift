//
//  ViewController.swift
//  SuperApp
//
//  Created by Henrique Melo on 06/04/21.
//

import UIKit
import UIKitBecaiOS

enum Categoria: String {
    case Semana = "www.google.com.br"
    case Dia
    case Tudo
}

enum EverisBecaColor {
    case corEveris
    case corBeca
    case corIOS
    var corSelecionada: UIColor {
        switch self { //#colorLiteral()
        case .corEveris: return #colorLiteral(red: 0.4599122405, green: 0.7652553916, blue: 0.2607991099, alpha: 1)
        case .corBeca: return #colorLiteral(red: 0.926291585, green: 0.234855473, blue: 0.1111717001, alpha: 1)
        case .corIOS: return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        }
    }
}

extension UIColor
{
    static let novaCorViaExtension = #colorLiteral(red: 0, green: 0.4797380567, blue: 0.9984433055, alpha: 1)
}

extension UIColor {
  struct CoresEveris {
    static var firstColor: UIColor  { return UIColor(red: 1, green: 0, blue: 0, alpha: 1) }
    static var secondColor: UIColor { return UIColor(red: 0, green: 1, blue: 0, alpha: 1) }
  }
}

class ViewController: UIViewController {

    @IBOutlet weak var stack: UIStackView!
    
    /**
     * So renderiza corretamente o Layout  chamando no  viewDidAppear
     * ou em um  IBAction
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupUI()
        showDetailsAction()
    }
    
    func setupUI() {
        //Component com XIB
        let myView = ViewEveris.fromNib() // .fromNib()
        myView.backgroundColor = .cyan
        stack.addArrangedSubview(myView)
        
        //fromNib()
        let myTitulo1 = TituloEveris.fromNib() // .fromNib()
        myTitulo1.setupUI(title: TituloEverisUI(description: ButtonBecaiOS.TituloNormal, delegate: self))
        stack.addArrangedSubview(myTitulo1)

        //Component ViewCode puro
        let myTitulo2 = TituloEveris.fromNib()
        myTitulo2.backgroundColor = .cyan
        myTitulo2.setupUI(title: "setupViewCode")
        myTitulo2.addTitulo(titulo: "Everis novo Titulo", y: 80, cor: .yellow)
        myTitulo2.addTitulo(titulo: "Everis sub Titulo", y: 150, cor: .novaCorViaExtension)
        //stack.addArrangedSubview(myTitulo2)
        
       // stack.translatesAutoresizingMaskIntoConstraints = false

        apiFilmes(categoria: .Semana, cor: .corEveris)
     }
    
    func apiFilmes(categoria: Categoria, cor: EverisBecaColor) {
        print("*******************************")
        print(categoria.rawValue)
        print(cor.corSelecionada)
        print("*******************************")
    }

    func showDetailsAction() {
        let vc = ViewDetailsVC.fromSB()
        vc.setupUI(delegate: self)
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: TituloEverisDelegate {
    public func buttonAction() {
        print("*******************************")
        print("BOTÃO ACIONADO!!!")
        print("*******************************")
        showDetailsAction()
    }
}

extension ViewController: DetailViewDelegate {
    func viewDetailAction() {
        print("*********************************")
        print(" viewDetailAction ")
        print("*********************************")
    }
}
