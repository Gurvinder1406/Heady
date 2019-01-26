//
//  MainViewController.swift
//  HeadyEcommerce
//
//  Created by Gurvinder Singh  on 13/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var tag: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.setupDrawer()
        self.getAllCategoriesAndProducts()
    }
    
    @IBAction func showMostViewedProducts(_ sender: Any) {
        tag = 1
        self.performSegue(withIdentifier: Constants.Segues.HomeToProductList.value(), sender: self)
    }
    @IBAction func showMostOrderedProducts(_ sender: Any) {
        tag = 2
        self.performSegue(withIdentifier: Constants.Segues.HomeToProductList.value(), sender: self)
    }
    @IBAction func showMostSharedProducts(_ sender: Any) {
        tag = 3
        self.performSegue(withIdentifier: Constants.Segues.HomeToProductList.value(), sender: self)
    }
 
    @IBAction func searchCategories(_ sender: Any) {
        self.performSegue(withIdentifier: Constants.Segues.HomeToCategorySearch.value(), sender: self)
    }
    
    
}


extension MainViewController {
    
    func getAllCategoriesAndProducts() {
        WebserviceManager.webserviceInstance.getData(urlString: Constants.sharedInstance.getCategoriesAndProducts(), completion: {
            (isSuccess, reason, data) in

            if isSuccess {
                do {
                    DataOperator.sharedInstance.categoryAndProductsObject = try JSONDecoder().decode(CategoryAndRanking.self, from: data!)
                } catch {
                    print(error)
                }
            } else {
                print(reason)
            }
        })
    }
}


extension MainViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Segues.HomeToProductList.value() {
            
            let vc = segue.destination as! ProductList
            
            switch tag {
                
            case 1:
                   vc.arr_Products = DataOperator.sharedInstance.getProductsWithRanking(type: .mostViewed)
                   break
            case 2:
                   vc.arr_Products = DataOperator.sharedInstance.getProductsWithRanking(type: .mostOrdered)
                   break
            case 3:
                   vc.arr_Products = DataOperator.sharedInstance.getProductsWithRanking(type: .mostShared)
                   break
            default:
                   vc.arr_Products = DataOperator.sharedInstance.getProductsWithRanking(type: .mostShared)
                   break
            }
            
        }
        
    }

}


/*
 extension MainViewController {
 
 func setupDrawer() {
 
 let vc_base = UIViewController()
 let vc_root = RootViewController(mainViewController: vc_base, topNavigationLeftImage: UIImage(named: "drawer_icon"))
 
 let vc_menu = MenuViewController()
 vc_menu.view.backgroundColor = .white
 
 let vc_drawer = DrawerController(rootViewController: vc_root, menuController: vc_menu)
 
 self.addChild(vc_drawer)
 self.view.addSubview(vc_drawer.view)
 vc_drawer.didMove(toParent: self)
 
 }
 
 }
 */


