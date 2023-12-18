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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        NotificationCenter.default.addObserver(self, selector: #selector(DarkNotification), name: NSNotification.Name.init(rawValue: "NumberSave"), object: nil)
    }
    @objc func DarkNotification(notif: Notification) {
        let mainViewReload = DispatchQueue.main
            mainViewReload.async {
                self.classView.selectItemBar()
            }
        }
}
