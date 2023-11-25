//
//  mainTabBarController.swift
//  FireTech
//
//  Created by Павел Уланов on 09.11.2022.
//

import UIKit

class mainTabBarController: UITabBarController {
    
    let classView = mainTabBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classView.rootVC = self
        classView.selectItemBar()
        self.tabBar.backgroundColor = .colorBackgroundView
    }
}
