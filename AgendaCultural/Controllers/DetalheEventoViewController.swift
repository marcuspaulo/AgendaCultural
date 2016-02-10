//
//  DetalheEventoViewController.swift
//  AgendaCultural
//
//  Created by MARCUS PAULO MELO on 10/02/16.
//  Copyright © 2016 MP. All rights reserved.
//

import UIKit

class DetalheEventoViewController: UIViewController {

    var evento = Evento();
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func viewDidLoad() {
        titleLabel.text = evento.title
        placeLabel.text = evento.place
        priceLabel.text = evento.price
    }
}
