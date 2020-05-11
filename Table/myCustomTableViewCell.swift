//
//  myCustomTableViewCell.swift
//  Table
//
//  Created by junior on 5/11/20.
//  Copyright © 2020 junior. All rights reserved.
//

import UIKit

class myCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    @IBOutlet weak var mySecondLevel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .brown
        
        backgroundColor = .cyan
        
        // este metodo es para poder hacer que nuestro texto se vea en un determinado numero de lineas
        mySecondLevel.numberOfLines = 0 // si le decimos que cero, le estamos indicando que es infinito
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        print("customCell",myFirstLabel.text ?? "")
    }
    
}
