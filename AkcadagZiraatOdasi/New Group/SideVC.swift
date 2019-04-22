//
//  SideVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

class SideVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    let array = [
        "Ana Sayfa",
        "Kurumsal",
        "Haberler",
        "Desteklemeler",
        "Tarımsal Danışmanlık",
        "Fuarlar",
        "Galeri",
        "İletişim",
        "Ziraat Mühendislerimize Sorun"
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.delegate = self

    }


}

