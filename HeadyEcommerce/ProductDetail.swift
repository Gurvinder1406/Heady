//
//  ProductDetail.swift
//  HeadyEcommerce
//
//  Created by Heckyl on 25/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class ProductDetail: UIViewController {

    @IBOutlet weak var iv_ProductImage: UIImageView!
    @IBOutlet weak var lbl_productName: UILabel!
    @IBOutlet weak var lbl_ProductPrice: UILabel!
    
    @IBOutlet weak var btn_Size: UIButton!
    
    
    var product_Details: Products!
    var arr_Sizes: Array<Int>! = Array<Int>()
    var arr_Colors: Array<String>! = Array<String>()
    var arr_Price: Array<Double>! = Array<Double>()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setPriceColorSize()
        self.setProductDetails()
        
    }
    

}



// MARK: Setup Data and UI
extension ProductDetail {
    
    func setProductDetails() {
        iv_ProductImage.image = UIImage(named: "productImage")
        lbl_productName.text = product_Details.name
        lbl_ProductPrice.text = "@₹ \(self.calculateFinalPrice(price: arr_Price[0], tax: product_Details.tax?.value ?? 0.00))"
    }
    
    func setPriceColorSize() {
        
        for singleVariant in product_Details?.variants ?? [] {
            arr_Price.append(singleVariant.price ?? 0.00)
            arr_Sizes.append(singleVariant.size ?? 0)
            arr_Colors.append(singleVariant.color ?? "")
        }
        
    }
    
    func calculateFinalPrice(price: Double, tax: Double) -> Double {
        return (price + (price*tax)/100)
    }

    
}


// MARK: Size and Color button action methods
