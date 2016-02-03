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
    
    var eventos:[String] = ["Carnaval", "Festa", "Party"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventos.count;
    }
    //
    //    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
    //
    //        cell.textLabel?.text = self.items[indexPath.row]
    //
    //        return cell
    //    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        
        cell.textLabel!.text = eventos[indexPath.row]
        
        //        cell.itemLabelCell.text = listaEmprestimo[indexPath.row].item
        
        
        //        cell.imagemCell.image = UIImage(named: listaEmprestimo[indexPath.row].imagem)
        
        //        cell.imagemCell.image = UIImage(named: "sem-foto.jpg")
        
        //        cell.nomeLabelCell.text = listaEmprestimo[indexPath.row].nome
        //        cell.dataDevolucaoLabelCell.text = listaEmprestimo[indexPath.row].dataDevolucao
        
        
        //        if (dataDevolucaoLabelCell.text == NSDate()) {
        //            cell.situacaoEmprestimoCell.image = UIImage(named: "red-bar.png")
        //        }
        
        
        
        return cell
        
    }


}
