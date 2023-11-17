//
//  mainTabBarController.swift
//  FireTech
//
//  Created by Павел Уланов on 09.11.2022.
//

import UIKit

class mainTabBarController: UITabBarController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBarCustom()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectItemBar()
    }
    
    
    private func selectItemBar(){
        viewControllers = [
            settingTabBarElement(VC: NewsViewController(), title: "Главная", image: UIImage(named: "main")!),
            settingTabBarElement(VC: calculationViewController(), title: "Расчеты", image: UIImage(named: "calc")!)]
    }
    
    private func settingTabBarElement(VC: UIViewController, title: String, image: UIImage) ->
    UIViewController {
        VC.tabBarItem.title = title
        VC.tabBarItem.image = image
        return VC
    }
    
    private func tabBarCustom(){
        tabBar.itemPositioning = .fill
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .systemGray
        tabBar.shadowImage = UIImage()
    }
}
