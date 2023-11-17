//
//  mainTabBarCiew.swift
//  FireTech
//
//  Created by Павел Уланов on 13.11.2023.
//

import Foundation
import UIKit

class mainTabBarView: mainTabBarController {
    
    
     func selectItemBar(){
        viewControllers = [
            settingTabBarElement(VC: NewsViewController(), title: "Главная", image: UIImage(named: "main")!),
            settingTabBarElement(VC: calculationViewController(), title: "Расчеты", image: UIImage(named: "calc")!)]
    }
    
     func settingTabBarElement(VC: UIViewController, title: String, image: UIImage) ->
    UIViewController {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = image
        return VC
    }
    
     func tabBarCustom(){
        tabBar.itemPositioning = .fill
        tabBar.backgroundImage = UIImage()
//        tabBar.backgroundColor = .systemGray
        tabBar.shadowImage = UIImage()
    }
}
