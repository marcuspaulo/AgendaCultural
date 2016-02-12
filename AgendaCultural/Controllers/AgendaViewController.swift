//
//  AgendaViewController.swift
//  AgendaCultural
//
//  Created by MARCUS PAULO MELO on 02/02/16.
//  Copyright © 2016 MP. All rights reserved.
//

import UIKit
import Alamofire
import SCLAlertView

class AgendaViewController: UIViewController {

    @IBOutlet weak var indicadorStatus: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var botaoTentarNovamente: UIButton!
    @IBOutlet weak var imagemBackgroundError: UIImageView!
    var eventos:[Evento] = []
    var jsonArray:NSMutableArray?

    
    override func viewDidLoad() {
        self.ocultaTableViewEmCasoDeErro(false)
        super.viewDidLoad()

        
//        SCLAlertView().showInfo("Important info", subTitle: "You are great")
        
        carregarEventos()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recarregar(sender: AnyObject) {
        carregarEventos()
    }
    //Função Responsável por Carregar os Eventos e converter para o Objeto Evento.
    func carregarEventos() {
        self.startAnimating()
        Alamofire.request(.GET, "http://b737a92f.ngrok.io/events.json").responseJSON { response in
            self.ocultaTableViewEmCasoDeErro(true)
            
            let JSON = response.result.value
            switch response.result {
                case .Success(_):
                    self.jsonArray = JSON as? NSMutableArray
                    for item in self.jsonArray! {
                        
                        let eventoJSON = Evento()
                        eventoJSON.title = item["title"]! as! String
                        eventoJSON.description = item["description"]! as! String
                        eventoJSON.photo = item["photo"]! as! String
                        eventoJSON.place = item["place"]! as! String
                        eventoJSON.address = item["address"]! as! String
                        eventoJSON.opening_date = item["opening_date"]! as! String
//                        eventoJSON.ending_date = item["ending_date"]! as! String
                        eventoJSON.category = item["category"]! as! String
                        eventoJSON.created_at = item["created_at"]! as! String
                        eventoJSON.updated_at = item["updated_at"]! as! String
                        eventoJSON.price = item["price"]! as! String
                        eventoJSON.hour = item["hour"]! as! String
                        self.eventos.append(eventoJSON)
                    }
                self.ocultaTableViewEmCasoDeErro(false)
                
                case .Failure(_):
                    SCLAlertView().showError("Falha na Conexão", subTitle:"Não é possível estabelecer uma conexão com o servidor. Tente novamente!", closeButtonTitle:"OK")
                    self.ocultaTableViewEmCasoDeErro(true)
            }
            self.stopAnimating()
            self.tableView.reloadData()
        }

    }
    
    /*
        Objetivo desta função é evitar código duplicado.
        Toda vez que ocorrer um erro, devemos passar true, 
        para que o tableView suma e os demais componentes apareçam
    */
    func ocultaTableViewEmCasoDeErro(condicao: Bool) {
        self.tableView.hidden = condicao
        self.imagemBackgroundError.hidden = !condicao
        self.imagemBackgroundError.hidden = !condicao
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func startAnimating()
    {
        self.indicadorStatus.startAnimating()
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
    }
    
    func stopAnimating()
    {
        self.indicadorStatus.stopAnimating()
        UIApplication.sharedApplication().endIgnoringInteractionEvents()
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("ItemAgendaCell")! as! AgendaTableViewCell
        
        cell.nomeEvento.text = eventos[indexPath.row].title
        cell.localEvento.text = eventos[indexPath.row].place
//        cell.imagemEvento.image = UIImage(named: eventos[indexPath.row].imagem)
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "SegueDetalheEvento" {
            let detalheEventoViewController = segue.destinationViewController as! DetalheEventoViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            detalheEventoViewController.evento = self.eventos[indexPath.row]
            
        }
    }
    

}
