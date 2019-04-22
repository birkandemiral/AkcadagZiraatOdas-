//
//  HomeVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

var Haberler: [HaberPresentation] = []

class HomeVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Haberler.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            
            return cell!
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! HaberlerTVC
            let haber = Haberler[indexPath.row - 1]
            cell.headerLBL.text = haber.header
            cell.bodyLBL.text = haber.body.htmlToString
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{

            return 250

        }else{
            
            return 100
        }
    }
    

    @IBOutlet weak var sideBarBTN: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "SliderTVC", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.register(UINib(nibName: "HaberlerTVC", bundle: nil), forCellReuseIdentifier: "cell2")

        sideBarBTN.target = revealViewController()
        
        sideBarBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

    }

}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
