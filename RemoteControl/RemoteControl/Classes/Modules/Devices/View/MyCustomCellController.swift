//
//  MyCustomCellController.swift
//  RemoteControl
//
//  Created by ISAAC DAVID SANTIAGO on 09/07/22.
//

import UIKit

class MyCustomCellController: UITableViewCell {
    var device: Device!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var estatusImg: UIImageView!
    
    public func setDevice(device: Device){
        self.device = device
        self.awakeFromNib()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        if let deviceOk = device {
            nameLabel.text = deviceOk.name
            
            let boldConfig = UIImage.SymbolConfiguration(weight: .bold)
            let imageEstatus = UIImage(systemName: "circle.fill",withConfiguration: boldConfig)?.withTintColor(.green)
            imageEstatus?.withTintColor(.green)
            
            //self.imageView?.image = imageEstatus
            estatusImg.tintColor = .green
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        print(device ?? "objeto no inciado")
        // Configure the view for the selected state
    }

}
