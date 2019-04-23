//
//  LoginVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON

import SVProgressHUD

class LoginVC: UIViewController {

    @IBOutlet weak var ePostaTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!

    @IBAction func loginBTN(_ sender: Any) {
        
        let parameters:[String : Any] = ["email" : ePostaTF.text!, "password" : passwordTF.text!]
        
        Alamofire.request("http://karspeynircim.com/codeForTarim/index.php/ServiceController/userLogin", method: .post, parameters: parameters, encoding: JSONEncoding.default)
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

    }
}
