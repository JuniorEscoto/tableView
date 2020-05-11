//
//  ViewController.swift
//  Table
//
//  Created by junior on 5/11/20.
//  Copyright © 2020 junior. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listaPaises = ["Nicaragua", "Guatemala", "Mexico", "colombia", "Panama"]

    @IBOutlet weak var table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        table.delegate = self
        
        // esta parte es para ocultar las columnas que aparecen vacias en la parte inferior
          // table.tableFooterView = UIView()
        
        // añadiendo nuestra celda personalizada a nuestra tabla
        // el nib es el controlador de vista
        table.register(UINib(nibName: "myCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustonCell") // forCellReuseIndentifier es el identificador que le pusimos a nuestra celda
    }


}

//  MARK: - extension de table Datasource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listaPaises.count
    }
    
    // creando un titulo de cabeza para nuestra tabla
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "celdas simples"
        } else{
            return "celdas personalizadas"
        }
    }
    
    // esta es para la alutra de nuestro header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    // con esta funcion le estamos diciendo el numero de secciones que tendra nuestra tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // con esta funcion podemos aumentar la altura de nuestra celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return 250
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // con el if, estamos comprobando en que seccion estamos
        if indexPath.section == 0 {
            // si es la primer seccion seguimos pintinado nuestras filas con el arreglo
            var cell = tableView.dequeueReusableCell(withIdentifier: "mycell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "mycell")
                // cell?.backgroundColor =  .red
                // cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                
                // esta parte es para realizar diferentes acciones a nuestra tabla
                cell?.accessoryType = .disclosureIndicator
            }
            cell?.textLabel?.text = listaPaises[indexPath.row]
            return cell!
        } else {
            // utilizando nuestra celda custom que hemos creado
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCustonCell", for: indexPath) as? myCustomTableViewCell
            
             cell?.myFirstLabel.text = String(listaPaises[indexPath.row])
            cell!.mySecondLevel.text = String(listaPaises[indexPath.row])
            
            if indexPath.row == 2 {
                cell?.mySecondLevel.text = "afdsfdafsdfadfdsfdasfdsfasdfsadfsdfdfsd3131313f"
            }
            
            return cell!
        }

    }
    
    
}

// MARK: Extension table Delegate
extension ViewController: UITableViewDelegate {
    
    // esta funcion nos permite dar click sobre la tabla, es algo asi como un evento
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // print(listaPaises[indexPath.row])
    }
    
}

