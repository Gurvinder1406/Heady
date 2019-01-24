//
//  Categories.swift
//  HeadyEcommerce
//
//  Created by Gurvinder Singh  on 20/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class CategoriesAndProducts: Codable {

    var id: Int? = 0
    var name: String? = ""
    var products: Array<Products>? = []
    var child_categories: Array<Int>? = []

}

class Products: Codable {
    
    var id: Int? = 0
    var name: String? = ""
    var date_added: String? = ""
    var variants: Array<Variants>?
    var tax: Tax?
    
    private enum keys: CodingKey {
        case date_added
        case id
        case name
        case tax
        case variants
    }
    
    init(date_added: String, id: Int, name: String, tax: Tax, variants: Array<Variants>) {
        self.date_added = date_added
        self.id = id
        self.name = name
        self.tax = tax
        self.variants = variants
    }
    
    required public init(from decoder: Decoder) throws {
        let decodedValues = try decoder.container(keyedBy: keys.self)
        date_added = try decodedValues.decode(String.self, forKey: .date_added)
        id = try decodedValues.decode(Int.self, forKey: .id)
        name = try decodedValues.decode(String.self, forKey: .name)
        tax = try decodedValues.decode(Tax.self, forKey: .tax)
        variants = try decodedValues.decode(Array<Variants>.self, forKey: .variants)
    }
    
    func printProduct() {
        print("Product: id - \(self.id!), name - \(self.name!), dateAdded - \(self.date_added!)")
    }
    
}

struct Tax: Codable {
    var name : String?
    var value : Double?
}

struct Variants: Codable {
    var color: String?
    var id: Int?
    var price: Double?
    var size: Int?
}

class CategoryAndRanking: Codable {
    var categories: Array<CategoriesAndProducts>? = []
    var rankings: Array<Rankings>?
    
    private enum keys: CodingKey {
        case categories
        case rankings
    }
    
    init() { }
    
    init(categories: Array<CategoriesAndProducts>, rankings: Array<Rankings>) {
        self.categories = categories
        self.rankings = rankings
    }
    
    required public init(from decoder: Decoder) throws {
        let decodedValues = try decoder.container(keyedBy: keys.self)
        categories = try decodedValues.decode(Array<CategoriesAndProducts>.self, forKey: .categories)
        rankings = try decodedValues.decode(Array<Rankings>.self, forKey: .rankings)
     }

}

class Rankings: Codable {
    var ranking: String?
    var products: Array<RankingProducts>?
    
    private enum keys: CodingKey {
        case ranking
        case products
    }
    
    init(ranking: String, products: Array<RankingProducts>) {
        self.ranking = ranking
        self.products = products
    }
    
    required public init(from decoder: Decoder) throws {
        let decodedValues = try decoder.container(keyedBy: keys.self)
        ranking = try decodedValues.decode(String.self, forKey: .ranking)
        products = try decodedValues.decode(Array<RankingProducts>.self, forKey: .products)
    }
    
}

struct RankingProducts: Codable {
    var id: Int?
    var order_count : Int?
    var view_count : Int?
    var shares : Int?
}
