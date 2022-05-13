//
//  ViewController.swift
//  Table
//
//  Created by ISAAC DAVID SANTIAGO on 12/05/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
   
    private let myCountries = ["España","Mexico","Perú","Colombia","Argentina"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
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
            return myCountries.count
        }
        
        return myCountries.count
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
            cell!.textLabel?.text = myCountries[indexPath.row]
            return cell!
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
            cell?.myFirstLabel.text = String(indexPath.row + 1)
            cell!.mySecondLabel.text = myCountries[indexPath.row]
            
            if indexPath.row == 2{
                cell!.mySecondLabel.text = "texto modificado adasidasdasdasdasdasdassdfsdfsdfsdfsdfsdfsd asdasdasdasdasdsad asdad"
            }
            return cell!
        }
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (myCountries[indexPath.row])
    }
    
}
