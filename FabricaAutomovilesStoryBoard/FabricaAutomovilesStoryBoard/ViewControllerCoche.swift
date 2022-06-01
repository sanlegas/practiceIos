//
//  ViewControllerCoche.swift
//  FabricaAutomovilesStoryBoard
//
//  Created by ISAAC DAVID SANTIAGO on 15/05/22.
//

import UIKit

class ViewControllerCoche: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var encenderButon: UIButton!
    
    @IBOutlet weak var apagarButon: UIButton!
    
    @IBOutlet weak var acelerarButon: UIButton!
    
    @IBOutlet weak var myLabel: UILabel!
    
    var tipoAutomovil:Int?
    var automovil:Automovil?
    var autoElectrico:AutomovilElectrico?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var estatus = ""
        imageView.image = UIImage(named:"coche")
        switch tipoAutomovil{
        case 1:
            automovil = Automovil()
            
            estatus = "Se creo el auto normal correctamente"
        case 2:
            autoElectrico = AutomovilElectrico()
            estatus = "Se creo el auto electrico correctamente"
        default:
            print("ninguno")
        }
        myLabel.text = estatus
    }

    @IBAction func encender(_ sender: Any) {
        
    }
    
    
    @IBAction func apagar(_ sender: Any) {
    }
    
    
    @IBAction func acelerar(_ sender: Any) {
    }
}
