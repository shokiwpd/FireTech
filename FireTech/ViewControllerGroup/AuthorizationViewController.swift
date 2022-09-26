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
    let viewContainer = customViewContainer()
    let loginField = loginTextField() // Временно лейбл
    let passwordField = passwordTextField()
    let loginButton = appActiveButton()
    let OfflineLoginButton = appClearButton()
    let viewSize = UIScreen.main.bounds.width-100
    
    override func viewDidLayoutSubviews() {
        createLayoutUIElement()
        print((viewSize - (((viewSize/8)*4)+65))/2)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitle("Set", for: .normal)
        OfflineLoginButton.setTitle("Offline", for: .normal)
        self.view.creatingElements([appNameLabel, viewContainer])
        self.viewContainer.creatingElements([loginField, passwordField, loginButton, OfflineLoginButton])
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
        
        loginField.positionOfElements(viewContainer.topAnchor, (viewSize - (((viewSize/8)*4)+65))/2,
                                      viewContainer.leadingAnchor, 10,
                                      viewContainer.trailingAnchor, -10,
                                      nil, 0)
        loginField.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width - 100)/8)).isActive = true
        passwordField.positionOfElements(loginField.bottomAnchor, 15,
                                         loginField.leadingAnchor, 0,
                                         loginField.trailingAnchor, 0,
                                         nil, 0)
        passwordField.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width - 100)/8)).isActive = true
        loginButton.positionOfElements(passwordField.bottomAnchor, 15,
                                       passwordField.leadingAnchor, 0,
                                       passwordField.trailingAnchor, 0,
                                       nil, 0)
        loginButton.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width - 100)/8)+10).isActive = true
        OfflineLoginButton.positionOfElements(loginButton.bottomAnchor, 15,
                                              loginButton.leadingAnchor, 0,
                                              loginButton.trailingAnchor, 0,
                                              nil, 0)
        OfflineLoginButton.heightAnchor.constraint(equalToConstant: ((UIScreen.main.bounds.width - 100)/8)+10).isActive = true
    }
    func getSizeScreen(){
        
    }
}
