//
//  AgendaTableViewCell.swift
//  AgendaCultural
//
//  Created by MARCUS PAULO MELO on 09/02/16.
//  Copyright © 2016 MP. All rights reserved.
//

import UIKit

class AgendaTableViewCell: UITableViewCell {

    @IBOutlet weak var nomeEvento: UILabel!
    @IBOutlet weak var localEvento: UILabel!
    @IBOutlet weak var imagemEvento: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
