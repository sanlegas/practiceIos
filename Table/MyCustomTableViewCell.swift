//
//  MyCustomTableViewCell.swift
//  Table
//
//  Created by ISAAC DAVID SANTIAGO on 13/05/22.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var myFirstLabel: UILabel!
    
    @IBOutlet weak var mySecondLabel: UILabel!
    
    @IBOutlet weak var myImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        myFirstLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myFirstLabel.textColor = .blue
        backgroundColor = .gray
        mySecondLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print(myFirstLabel.text ?? "")
    }
    
}
