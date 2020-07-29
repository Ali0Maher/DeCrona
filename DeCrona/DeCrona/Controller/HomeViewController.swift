//
//  HomeViewController.swift
//  DeCrona
//
//  Created by Ali Maher on 7/28/20.
//  Copyright © 2020 Ali Maher. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var mainText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        mainText.isEditable = false
    }
    



}
