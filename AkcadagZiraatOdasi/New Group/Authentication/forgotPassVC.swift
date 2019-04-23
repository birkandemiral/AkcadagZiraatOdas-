//
//  forgotPassVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

import Alamofire

import SwiftyJSON

import SVProgressHUD

class forgotPassVC: UIViewController {

    @IBOutlet weak var ePostaTF: UITextField!
    @IBAction func parolaBTN(_ sender: Any) {
        
        let parameters:[String : Any] = ["email" : ePostaTF.text!]
        
        Alamofire.request("http://karspeynircim.com/codeForTarim/index.php/ServiceController/userforgotPassword", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                let data = response.result.value
                
                let json = JSON(data!)
                
                if json == true{
                    SVProgressHUD.showSuccess(withStatus: "Başarılı")
                }else{
                    SVProgressHUD.showError(withStatus: "Hata")
                }        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
