//
//  Constants.swift
//  HeadyEcommerce
//
//  Created by Gurvinder Singh  on 13/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//


import UIKit

class Constants {

    static let sharedInstance = Constants()
    
    private init() { }
    
    func getCategoriesAndProducts() -> String {
        return "https://stark-spire-93433.herokuapp.com/json"
    }
    
    
    enum Segues: String {
        
        case ProductListToDetail
        case HomeToProductList
        case HomeToCategorySearch
        case SearchToProductList
        
        func value() -> String {
            return self.rawValue
        }
    }
    
}
