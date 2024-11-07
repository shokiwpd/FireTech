//
//  mainTabBarCiew.swift
//  FireTech
//
//  Created by Павел Уланов on 13.11.2023.
//

import Foundation
import UIKit

class mainTabBarView: UITabBarController {
    
    weak var rootVC: mainTabBarController?

    func selectItemBar(){
        rootVC!.viewControllers = [
            settingTabBarElement(VC: UINavigationController(rootViewController: NewsViewController()), title: "Главная", image: UIImage(named: "main")!),
            settingTabBarElement(VC: UINavigationController(rootViewController:calculationViewController()), title: "Расчеты", image: UIImage(named: "calc")!)]
    }
    
    
    func settingTabBarElement(VC: UINavigationController, title: String, image: UIImage) ->
    UIViewController {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = image
        return VC
    }
    
    @objc func printTest() {
        print("Work")
    }
}
extension mainTabBarView  {
    
}
