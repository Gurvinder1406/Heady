//
//  DataOperator.swift
//  HeadyEcommerce
//
//  Created by Heckyl on 21/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class DataOperator {

    static let sharedInstance = DataOperator()
    var categoryAndProductsObject: CategoryAndRanking! = CategoryAndRanking()
    
    private init() { }
    
    func getAllProducts() -> Array<Products> {
        var arr_Products: Array<Products> = []

        categoryAndProductsObject.categories?.forEach({ (singleCategory) in
            arr_Products = arr_Products + (singleCategory.products ?? [])
        })

        return arr_Products
    }
    
    func getProductsWithRanking(type: RankingTypeForProduct) -> Array<Products> {
        
        let allProducts = getAllProducts()
        let mostViewedProductList = getProductsForRanking(type: type)
        
        let mostViewedProducts = allProducts.filter { (singleProduct) -> Bool in
            return mostViewedProductList.contains(where: { (singleRankingProduct) -> Bool in
                return singleRankingProduct.id == singleProduct.id
            })
        }
        return mostViewedProducts
        
    }
    
    func getProductsForRanking(type: RankingTypeForProduct) -> Array<RankingProducts> {
        switch type {
            case .mostViewed:
                return (categoryAndProductsObject?.rankings?[0] ?? Rankings(ranking: "", products: Array<RankingProducts>())).products ?? Array<RankingProducts>()
            case .mostOrdered:
                return (categoryAndProductsObject?.rankings?[1] ?? Rankings(ranking: "", products: Array<RankingProducts>())).products ?? Array<RankingProducts>()
            case .mostShared:
                return (categoryAndProductsObject?.rankings?[2] ?? Rankings(ranking: "", products: Array<RankingProducts>())).products ?? Array<RankingProducts>()
        }
    }
    
    enum RankingTypeForProduct {
        case mostOrdered
        case mostViewed
        case mostShared
    }
    
}
