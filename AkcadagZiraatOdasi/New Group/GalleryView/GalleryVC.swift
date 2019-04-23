//
//  GalleryVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 23.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Kingfisher

var galleryDataSource = [GalleryPresentation]()

class GalleryVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return galleryDataSource.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GalleryTVC
        let image = galleryDataSource[indexPath.row]
        
        cell.label.text = image.header
        
        let url = image.image
        
        let urlConvert : NSString = url as NSString
        
        let urlStr : NSString = urlConvert.addingPercentEscapes(using: String.Encoding.utf8.rawValue)! as NSString
        
        let searchURL : NSURL = NSURL(string: urlStr as String)!
        
        let resource = ImageResource(downloadURL: searchURL as URL)
        
        cell.img.kf.setImage(with: resource)
        
        cell.img.clipsToBounds = true
    
        cell.img.contentMode = .scaleAspectFill
        
        return cell
    }
    

    @IBOutlet weak var siderBarBTN: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        galleryDataSource = Gallery
        
        tableView.register(UINib(nibName: "GalleryTVC", bundle: nil), forCellReuseIdentifier: "cell")
        
        tableView.reloadData()
        
        siderBarBTN.target = revealViewController()
        
        siderBarBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }

}
