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
    @IBOutlet weak var tf_Size: UITextField!
    @IBOutlet weak var tf_Color: UITextField!
    
    
    
    var product_Details: Products!
    var arr_Sizes: Array<Int>! = Array<Int>()
    var arr_Colors: Array<String>! = Array<String>()
    var arr_Price: Array<Double>! = Array<Double>()
    var pv_Size = UIPickerView()
    var pv_Color = UIPickerView()
    
    
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
        tf_Size.text = String(arr_Sizes[0])
        tf_Color.text = arr_Colors[0]
        
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


// MARK: Textfield Delegate Methods

extension ProductDetail: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tf_Size {
            
        } else if textField == tf_Color {
            
        }
    }
    
}


// MARK: Picker Delegate Methods

extension ProductDetail: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        if pickerView == pv_Size {
            return arr_Sizes.count
        } else if pickerView == pv_Color {
            return arr_Colors.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }
    
}
