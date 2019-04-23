//
//  ContactVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 23.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON

import SVProgressHUD

class ContactVC: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var message: UITextField!
    
    @IBOutlet weak var sideBarBTN: UIBarButtonItem!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var mineView: UIView!
    
    @IBAction func GonderBTN(_ sender: Any) {
        
        let parcala = name.text?.split(separator: " ")
        
        let isim = parcala?.first
        
        let soyisim = parcala?.last
        
        let parameters:[String : Any] = ["name" : isim ?? "","surname" : soyisim ?? "","email" : email.text ?? "", "message" : message.text ?? ""]
        
        print(parameters)
        
        var url = ""

        if tag == 7{
            
            url = "http://karspeynircim.com/codeForTarim/index.php/ServiceController/saveConnectionForm"
            
        }else if tag == 8{
            
            url = "http://karspeynircim.com/codeForTarim/index.php/ServiceController/saveQuestionForm"

        }
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                let data = response.result.value
                
                let json = JSON(data!)
                
                if json == true{
                    SVProgressHUD.showSuccess(withStatus: "Başarılı")
                }else{
                    SVProgressHUD.showError(withStatus: "Hata")
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tag == 7{
            self.title = "İletişim"
            
        }else if tag == 8 {
            self.title = "Ziraat Mühendislerimize Sorun"
            mineView.isHidden = true
            myView.backgroundColor = UIColor.white
        }
    
        
        sideBarBTN.target = revealViewController()
        
        sideBarBTN.action = #selector(SWRevealViewController.revealToggle(_:))
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

}
