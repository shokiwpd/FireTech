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
        tabBarCustom()
        selectItemBar()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .clear
        tabBar.shadowImage = UIImage()
    }
    
    
    
    private func selectItemBar(){
        viewControllers = [
        settingTabBarElement(VC: MainViewController(), title: "Title")]
    }
    
    private func settingTabBarElement(VC: UIViewController, title: String) ->
    UIViewController {
        VC.tabBarItem.title = title
//        VC.tabBarItem.image = image
        return VC
    }
    
    private func tabBarCustom(){
        let roundLayer = CAShapeLayer()
        let beziePatching = UIBezierPath(
            roundedRect: CGRect(x: 10, y: tabBar.bounds.minY - 14, width: (tabBar.bounds.width - 20), height: (tabBar.bounds.height + 24)),
            cornerRadius: tabBar.bounds.height / 2
        )
        roundLayer.path = beziePatching.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = tabBar.bounds.width - 20
        tabBar.itemPositioning = .centered
        roundLayer.fillColor = UIColor.red.cgColor
        tabBar.selectedItem?.title = "Go"
        tabBar.selectedItem?.badgeColor = UIColor.red
    }
}

