//
//  SearchByCategory.swift
//  HeadyEcommerce
//
//  Created by Gurvinder Singh  on 27/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class SearchByCategory: UIViewController {

    @IBOutlet weak var tv_CategoryList: UITableView!
    
    var arr_categories: Array<CategoriesAndProducts> = []
    var arr_products: Array<Products> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tv_CategoryList.separatorInset = UIEdgeInsets.zero
        arr_categories = DataOperator.sharedInstance.getAllCategories()
        tv_CategoryList.reloadData()
    }
    

}

// MARK: Tableview Delegate Methods

extension SearchByCategory: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        cell.textLabel?.text = arr_categories[indexPath.row].name ?? ""
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if arr_categories[indexPath.row].products?.count ?? 0 > 0 {
            arr_products = arr_categories[indexPath.row].products ?? []
        } else {
            arr_products = DataOperator.sharedInstance.getProductsForGiven(categoryIds: arr_categories[indexPath.row].child_categories ?? [])
        }
        performSegue(withIdentifier: Constants.Segues.SearchToProductList.value(), sender: self)

    }
    
    
}


extension SearchByCategory {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Constants.Segues.SearchToProductList.value() {
            let vc = segue.destination as! ProductList
            vc.arr_Products = arr_products
        }
        
    }
    
}
