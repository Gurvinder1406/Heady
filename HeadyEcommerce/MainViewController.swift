//
//  MainViewController.swift
//  HeadyEcommerce
//
//  Created by Gurvinder Singh  on 13/01/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupDrawer()
    }

}


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

