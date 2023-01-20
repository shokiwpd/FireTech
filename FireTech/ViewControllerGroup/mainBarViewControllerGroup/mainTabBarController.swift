//
//  mainTabBarController.swift
//  FireTech
//
//  Created by Павел Уланов on 09.11.2022.
//

import UIKit

class mainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    private func selectItemBar(){
        viewControllers = []
    }
    
    private func settingTabBarElement(VC: UIViewController, title: String, image: UIImage) ->
    UIViewController {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = image
        return VC
    }
}
