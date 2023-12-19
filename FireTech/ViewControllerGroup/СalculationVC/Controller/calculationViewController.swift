//
//  calculationController.swift
//  FireTech
//
//  Created by Павел Уланов on 23.07.2023.
//

import Foundation
import UIKit

class calculationViewController: UIViewController {
    
    let classView = calculationView()
    
    override func loadView() {
        super.loadView()
        classView.addElementToController(view)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classView.createLayoutUIElement(view)
        classView.rootVC = self
        classView.checkData()
        view.backgroundColor = .colorBackgroundView
        classView.settingViewFunc(view)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        classView.actionFunc()
        self.tabBarController?.navigationItem.title = "Расчеты"
    }
    
    
    
}


