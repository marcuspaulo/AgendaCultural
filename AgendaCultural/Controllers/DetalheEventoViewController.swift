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
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        print(self.evento.place)
        titleLabel.text = self.evento.title
        placeLabel!.text = self.evento.place
        priceLabel!.text = self.evento.price
        
        descriptionLabel!.text = self.evento.description
        addressLabel!.text = self.evento.address
        openingDateLabel!.text = self.evento.opening_date
        endingDateLabel!.text = self.evento.ending_date
        categoryLabel!.text = self.evento.category
        
        //Retirar a duplicidade de Código - passar para uma classe Utilitaria
        //Convertendo de Imagem Base 64
        let encodedImageData = self.evento.photo
        let decodedData = NSData(base64EncodedString: encodedImageData, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
        
        var decodedimage = UIImage(named: "mascara-teatro.jpg")
        if (decodedData != nil) {
            decodedimage = UIImage(data: decodedData!)
            
        }
        image.image = decodedimage! as UIImage
    }
}
