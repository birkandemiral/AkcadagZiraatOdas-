//
//  tableViewVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 23.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

var tag: Int?

class tableViewVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var dataSource = [HaberPresentation]()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sideBarBTN: UIBarButtonItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HaberlerTVC
        let haber = dataSource[indexPath.row]
        cell.headerLBL.text = haber.header
        cell.bodyLBL.text = haber.body.htmlToString
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switch tag! {
        case 0:
            self.title = "Haberler"
            dataSource = Haberler
        case 1:
            self.title = "Destekler"
            dataSource = Destekler
        case 2:
            self.title = "Tarımsal Danışmanlık"
            dataSource = Duyurular
        case 3:
            self.title = "Fuarlar"
            dataSource = Fuar
        default:
            print(Error.self)
        }
        
        tableView.register(UINib(nibName: "HaberlerTVC", bundle: nil), forCellReuseIdentifier: "cell")
            
        tableView.reloadData()
        
        sideBarBTN.target = revealViewController()
        
        sideBarBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
