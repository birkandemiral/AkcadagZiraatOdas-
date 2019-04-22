//
//  HaberPresentation.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 22.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import Foundation

struct HaberPresentation{
    let body,create_date,header,image : String
    let id : Int
}
protocol HaberProtocol {
    func updateHaber(_haberler: [HaberPresentation])
}
