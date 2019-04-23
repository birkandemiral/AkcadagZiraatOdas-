//
//  GalleryPresentation.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 23.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import Foundation

struct GalleryPresentation{
    let id: String
    let header: String
    let image: String
    let gl_id: String
}

protocol GalleryUpdate {
    func updateGallery(_ gallery: [GalleryPresentation])
}
