//
//  ViewController.swift
//  Table
//
//  Created by ISAAC DAVID SANTIAGO on 12/05/22.
//

import UIKit

//Importar libreria de coreData
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
   
    //referencia al managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var myCountries:[Pais]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
        recuperaDatos()
    }
    
    @IBAction func addNewAction(_ sender: Any) {
        print("add new country")
        
        //Crear alerta
        let alert = UIAlertController(title: "Agregar país", message: "Agrega un nuevo país", preferredStyle: .alert)
        alert.addTextField()
        let botonAlerta = UIAlertAction(title: "Añadir", style: .default){ (action) in
            let textField = alert.textFields![0]
            let nuevoPais = Pais(context: self.context)
            nuevoPais.nombre = textField.text
            
            try! self.context.save()
            
            self.recuperaDatos()
            
        }
        alert.view.setNeedsLayout()

        alert.addAction(botonAlerta)
        self.present(alert,animated: true, completion: nil)
    }
    
    func recuperaDatos(){
        do{
            self.myCountries = try context.fetch(Pais.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }catch{
            print("Error recuperando datos")
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        }
        return "Celdas custom"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0{
            return "footer para celdas simple"
        }
        return "footer para celdas custom"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
        if section == 0{
            return myCountries!.count
        }
        
        return myCountries!.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView (_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if indexPath.section == 0{
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil{
                cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .disclosureIndicator
            }
            cell!.textLabel?.text = myCountries![indexPath.row].nombre
            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
            cell?.myFirstLabel.text = String(indexPath.row + 1)
            cell!.mySecondLabel.text = myCountries![indexPath.row].nombre
            
            //if indexPath.row == 2{
              //  cell!.mySecondLabel.text = "texto modificado adasidasdasdasdasdasdassdfsdfsdfsdfsdfsdfsd asdasdasdasdasdsad asdad"
            //}
            return cell!
        }
    }
    
    
    
    
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (myCountries![indexPath.row])
    }
    
    // funcionalidad para hacer swipe a la izquierda
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        //crear accion de eliminar
        
        let accionEliminar = UIContextualAction(style: .destructive, title: "Eliminar"){
            (action,view,completionHandler) in
            
            let paisEliminar = self.myCountries![indexPath.row]
            
            self.context.delete(paisEliminar)
            
            try! self.context.save()
            
            self.recuperaDatos()
            
        }
        
        return UISwipeActionsConfiguration(actions: [accionEliminar])
    }
    
    
}
