//
//  YonetimKuruluVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 23.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

class YonetimKuruluVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let unvan = ["Yönetim Kurulu Başkanı","Yönetim Kurulu Başkan V.","Muhasip Üye","Yönetim Kurulu Üyesi","Yönetim Kurulu Üyesi","Yönetim Kurulu Üyesi","Yönetim Kurulu Üyesi","GenelSekreter"]
    
    let isim = ["Süleyman BOYRAZ","Şevki IŞIK","Yusuf Demircan","Mustafa ŞAHİN","Mehmet İNAN","Ali Seydi Barutçu","Yusuf Durmuş","Birkan Karadağ"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isim.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = isim[indexPath.row]
        
        cell?.detailTextLabel?.text = unvan[indexPath.row]
        
        return cell!
    }
    

    @IBOutlet weak var sideBarBTN: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        sideBarBTN.target = revealViewController()
        
        sideBarBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }


}
