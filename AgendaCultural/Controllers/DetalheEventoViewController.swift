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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var openingDateLabel: UILabel!
    @IBOutlet weak var endingDateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        titleLabel.text = evento.title
        placeLabel.text = evento.place
        priceLabel.text = evento.price
        
        descriptionLabel.text = evento.description
        addressLabel.text = evento.address
        openingDateLabel.text = evento.opening_date
        endingDateLabel.text = evento.ending_date
        categoryLabel.text = evento.category
    }
}
