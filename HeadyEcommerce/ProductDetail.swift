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

        self.initializeVariablesAndFields()
        self.setPriceColorSize()
        self.setProductDetails()
        
    }
    
}



// MARK: Setup Data and UI
extension ProductDetail {
    
    func initializeVariablesAndFields() {
        pv_Size.delegate = self
        pv_Color.delegate = self
        
//        tf_Size.inputView = pv_Size
        tf_Size.isEnabled = false
        tf_Color.inputView = pv_Color
        
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(closePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        tf_Color.inputAccessoryView = toolBar
        
    }
    
    func setProductDetails() {
        iv_ProductImage.image = UIImage(named: "productImage")
        lbl_productName.text = product_Details.name
        self.setVariantForProduct(index: 0)
    }
    
    func setVariantForProduct(index: Int) {
        lbl_ProductPrice.text = "@₹ \(self.calculateFinalPrice(price: arr_Price[index], tax: product_Details.tax?.value ?? 0.00))"
        tf_Size.text = String(arr_Sizes[index])
        tf_Color.text = arr_Colors[index]
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


// MARK: Picker Delegate Methods

extension ProductDetail: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
//        if pickerView == pv_Size {
//            return arr_Sizes.count
//        } else
            if pickerView == pv_Color {
            return arr_Colors.count
        } else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            if pickerView == pv_Color {
                tf_Color.text = arr_Colors[row]
                self.setVariantForProduct(index: row)
            }
//        else if pickerView == pv_Size {
//            tf_Size.text = String(arr_Sizes[row])
//        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pv_Color {
            return arr_Colors[row]
        }
//        else if pickerView == pv_Size {
//            return String(arr_Sizes[row])
//        }
        else {
            return ""
        }
    }
    
    @objc func closePicker() {
        tf_Color.resignFirstResponder()
    }
}
