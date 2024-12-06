//
//  navigationController.swift
//  FireTech
//
//  Created by Павел Уланов on 15.11.2024.
//

import UIKit

class navigationControllers: UINavigationController {
    
    let navigationViewClass = navigationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        navigationViewClass.customNavigation(self)
    }
    
}
