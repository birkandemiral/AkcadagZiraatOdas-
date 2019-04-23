//
//  registerVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Alamofire

import SVProgressHUD

import SwiftyJSON

class registerVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var tcTF: UITextField!
    
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var passwordAgainTF: UITextField!
    
    @IBAction func registerBTN(_ sender: Any) {
        
        let parameters:[String : Any] = [
            "email" : emailTF.text!,
            "password" : passwordTf.text!,
            "name" : nameTF.text!,
            "tc" : tcTF.text!
        ]
        
        Alamofire.request("http://karspeynircim.com/codeForTarim/index.php/ServiceController/saveUser", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                let data = response.result.value
                
                let json = JSON(data!)
                
                if json == true{
                    SVProgressHUD.showSuccess(withStatus: "Başarılı")
                }else{
                    SVProgressHUD.showError(withStatus: "Hata")
                }        }
    }
    @IBOutlet weak var registerBTN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
