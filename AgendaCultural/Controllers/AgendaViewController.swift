//
//  AgendaViewController.swift
//  AgendaCultural
//
//  Created by MARCUS PAULO MELO on 02/02/16.
//  Copyright © 2016 MP. All rights reserved.
//

import UIKit

class AgendaViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var eventos:[Evento] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let evento = Evento()
        evento.nome = "Carnaval na Praça"
        evento.local = "Praça da Apoteose"
        evento.imagem = "carnaval.jpg"
        eventos.append(evento)
        
        let evento2 = Evento()
        evento2.nome = "Rock Brasil 2016"
        evento2.local = "Estádio Municipal"
        evento2.imagem = "rock.jpg"
        eventos.append(evento2)
        
        let evento3 = Evento()
        evento3.nome = "Teatro dos Artistas"
        evento3.local = "Teatro Municipal"
        evento3.imagem = "teatro.jpg"
        eventos.append(evento3)
        
        let evento4 = Evento()
        evento4.nome = "Evento aleatório"
        evento4.local = "Lugar Qualquer"
        evento4.imagem = "Eventos.jpg"
        eventos.append(evento4)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count;
    }
        
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ItemAgendaCell")! as! AgendaTableViewCell
        
        cell.nomeEvento.text = eventos[indexPath.row].nome
        cell.localEvento.text = eventos[indexPath.row].local
        cell.imagemEvento.image = UIImage(named: eventos[indexPath.row].imagem)
        
        return cell
        
    }
    

}
