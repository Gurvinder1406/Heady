//
//  ProductListCell.swift
//  HeadyEcommerce
//
//  Created by Heckyl on 24/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class ProductListCell: UITableViewCell {

    @IBOutlet weak var img_ProductImage: UIImageView!
    @IBOutlet weak var lbl_ProductName: UILabel!
    @IBOutlet weak var lbl_dateAdded: UILabel!
    @IBOutlet weak var lbl_variantsCount: UILabel!
    
    
    func populateProduct(product: Products) {
        
        lbl_dateAdded.adjustsFontSizeToFitWidth = true
        
        img_ProductImage.image = UIImage(named: "instaSquare")
        lbl_ProductName.text = product.name
        lbl_dateAdded.text = "Updated on: \(product.date_added ?? "")"
        lbl_variantsCount.text = "Available in \(String(product.variants?.count ?? 0)) variants  >>"
    }
    

}
