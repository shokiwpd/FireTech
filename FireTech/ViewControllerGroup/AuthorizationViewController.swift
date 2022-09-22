//
//  AuthorizationViewController.swift
//  FireTech
//
//  Created by Павел Уланов on 02.09.2022.
//

import Foundation
import UIKit


class AuthorizationViewController: UIViewController {
    //Объявление элементов интерфейса
    let appNameLabel = headingLabel()
    let viewContainer: UIView = { //Временная настройка
        let viewes = UIView()
        viewes.translatesAutoresizingMaskIntoConstraints = false
            viewes.backgroundColor = .red
        return viewes
    }()
    let loginField = loginTextField() // Временно лейбл
    let passwordField = passwordTextField()
    let loginButton = appActiveButton()
    let OfflineLoginButton = appClearButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.creatingElements([appNameLabel, viewContainer])
        self.viewContainer.creatingElements([loginField, passwordField, loginButton, OfflineLoginButton])
        createLayoutUIElement()
    }

    //Расстановка элементов (Код надо будет распиать более аккуратно и компактно)
    func createLayoutUIElement() {
        appNameLabel.positionOfElements(nil, 0,
                                        view.leadingAnchor, 20,
                                        view.trailingAnchor, -20,
                                        viewContainer.topAnchor, -50)
        
        viewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewContainer.widthSize(UIScreen.main.bounds.width - 100)
        viewContainer.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100).isActive = true
        
        loginField.positionOfElements(viewContainer.topAnchor, 20,
                                      viewContainer.leadingAnchor, 20,
                                      viewContainer.trailingAnchor, -20,
                                      nil, 0)
        passwordField.positionOfElements(loginField.topAnchor, 50,
                                         loginField.leadingAnchor, 0,
                                         loginField.trailingAnchor, 0,
                                         nil, 0)
        loginButton.positionOfElements(passwordField.bottomAnchor, 20,
                                       passwordField.leadingAnchor, 0,
                                       passwordField.trailingAnchor, 0,
                                       nil, 0)
        OfflineLoginButton.positionOfElements(loginButton.bottomAnchor, 20,
                                              loginButton.leadingAnchor, 0,
                                              loginButton.trailingAnchor, 0,
                                              nil, 0)
        
        
        
    }
    func getSizeScreen(){
        
    }
}
