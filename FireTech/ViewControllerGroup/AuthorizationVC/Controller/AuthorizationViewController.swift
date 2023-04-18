//
//  AuthorizationViewController.swift
//  FireTech
//
//  Created by Павел Уланов on 02.09.2022.
//

import Foundation
import UIKit


class AuthorizationViewController: UIViewController {
    //MARK: Объявление классов MVC
    let classView = AuthorizationViewSetting()
    let classModel = AuthorizationModelSetting()
    
    override func loadView() {
        super.loadView()
        classView.createElementToView(view)
    }
    
    override func viewDidLayoutSubviews() {
        //MARK: Задаем положение элементов на экране
        classView.createLayoutUIElement(view)
        classView.displaySetting()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Задаем цвет фона
        definesPresentationContext = true
        view.backgroundColor = UIColor.colorBackgroundView
        classView.addsButtonAction()
        classView.rootVC = self
        
    }
}


