//
//  ProductList.swift
//  HeadyEcommerce
//
//  Created by Heckyl on 24/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class ProductList: UIViewController {

    var arr_Products: Array<Products> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for s in  arr_Products {
            s.printProduct()
        }
    }
    
}


// MARK: TableView Delegate Methods
extension ProductList: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_Products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ProductListCell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductListCell
        cell.populateProduct(product: arr_Products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
