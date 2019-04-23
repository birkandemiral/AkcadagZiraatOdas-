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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "HomeNavVC", sender: self)
        case 2:
            tag = 0
            self.performSegue(withIdentifier: "Haberler", sender: self)
        case 3:
            tag = 1
            self.performSegue(withIdentifier: "Destekler", sender: self)
        case 4:
            tag = 2
            self.performSegue(withIdentifier: "Duyurular", sender: self)
        case 5:
            tag = 3
            self.performSegue(withIdentifier: "Fuarlar", sender: self)
        case 6:
            self.performSegue(withIdentifier: "Gallery", sender: self)
        case 7:
            tag = 7
            self.performSegue(withIdentifier: "iletisim", sender: self)
        case 8:
            tag = 8
            self.performSegue(withIdentifier: "ziraat", sender: self)
        
        default:
            self.performSegue(withIdentifier: "Soru", sender: self)

        }
    }

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        tableView.delegate = self

    }


}

