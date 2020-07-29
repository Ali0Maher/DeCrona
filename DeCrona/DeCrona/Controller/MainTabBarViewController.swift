//
//  MainTabBarViewController.swift
//  DeCrona
//
//  Created by Ali Maher on 7/28/20.
//  Copyright © 2020 Ali Maher. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    @IBOutlet weak var mainTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.selectedIndex = 1
    }
    


}
