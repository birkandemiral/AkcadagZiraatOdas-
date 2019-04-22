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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = "http://karspeynircim.com/codeForTarim/index.php/ServiceController/getContentByCategory?category=haberler"
        
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
                    
                    Haberler.append(haber)
                }
                
                print("Haberler: \(Haberler)")
                
        }
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
}


