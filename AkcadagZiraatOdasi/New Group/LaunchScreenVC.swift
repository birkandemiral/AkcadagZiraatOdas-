//
//  LaunchScreenVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import SwiftyJSON

import Alamofire

var Haberler: [HaberPresentation] = []

var Duyurular: [HaberPresentation] = []

var Destekler: [HaberPresentation] = []

var Fuar: [HaberPresentation] = []

var Gallery: [GalleryPresentation] = []


final class LaunchScreenVC: UIViewController{
    @IBAction func unLogin(_ sender: Any) {
    }
    
    @IBAction func login(_ sender: Any) {
    }
    
    @IBAction func register(_ sender: Any) {
    }
    @IBOutlet weak var unLogin: UIButton!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var register: UIButton!
    
    fileprivate func veriCek(_ category: String) {
        let url = "http://karspeynircim.com/codeForTarim/index.php/ServiceController/getContentByCategory?category=\(category)"
        
        Alamofire.request(url)
            .responseJSON { response in
                
                let data = response.result.value
                
                let json = JSON(data!)
                
                for i in json.arrayValue{
                    
                    let haber = HaberPresentation.init(
                        body: i["body"].stringValue,
                        create_date: i["create_date"].stringValue,
                        header: i["header"].stringValue,
                        image: "http://karspeynircim.com" + i["image"].stringValue,
                        id: i["id"].intValue
                    )
                    switch category{
                    case "haberler":
                        Haberler.append(haber)
                        print("Haberler = \(Haberler)")
                    case "duyurular":
                        Duyurular.append(haber)
                        print("Duyurular = \(Duyurular)")
                    case "destekler":
                        Destekler.append(haber)
                        print("Destekler = \(Destekler)")
                    case "fuarlar":
                        Fuar.append(haber)
                        print("Fuar = \(Fuar)")
                    default:
                        print("Error")
                    }
                    
            }
        }
    }
    
    fileprivate func getGallery() {
        let url = "http://karspeynircim.com/codeForTarim/index.php/ServiceController/getGalery"
        
        Alamofire.request(url)
            .responseJSON { response in
                
                let data = response.result.value
                
                let json = JSON(data!)
                
                for i in json.arrayValue{
                    
                    let image = GalleryPresentation.init(
                        id: i["id"].stringValue,
                        header: i["header"].stringValue,
                        image: "http://karspeynircim.com" + i["image"].stringValue,
                        gl_id: i["gl_id"].stringValue
                    )
                    Gallery.append(image)
                }
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Haberler.removeAll()
        Destekler.removeAll()
        Duyurular.removeAll()
        Fuar.removeAll()
        Gallery.removeAll()
        
        veriCek("haberler")
        veriCek("destekler")
        veriCek("duyurular")
        veriCek("fuarlar")
        getGallery()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}


