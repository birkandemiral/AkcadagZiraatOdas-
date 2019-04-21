//
//  AuthorizationAPI.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 21.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//
//{"name":"ey112313up","email":"eyup.kasdadsavak@outlook.com","password":"sadad","tc":12313}

import Foundation

struct Login: Decodable {
    
    let name: String
    
    let email: String
    
    let password: String
    
    let tc: String
    
    init(name: String, email: String, password: String, tc: String){
        
        self.name = name
        
        self.email = email
        
        self.password = password
        
        self.tc = tc
    }
  
}

struct LoginResponse: Decodable {
    
}
