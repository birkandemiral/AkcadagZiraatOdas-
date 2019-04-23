//
//  GalleryTVC.swift
//  AkcadagZiraatOdasi
//
//  Created by birkan demiral on 23.04.2019.
//  Copyright © 2019 Freelance. All rights reserved.
//

import UIKit

class GalleryTVC: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
