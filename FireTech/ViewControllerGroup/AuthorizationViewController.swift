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
    let loginField = loginTextField()
    let passwordField = passwordTextField()
    let loginButton = appActiveButton()
    let OfflineLoginButton = appClearButton()

    
    override func viewDidLayoutSubviews() {
        createLayoutUIElement()//Задаем положение элементов на экране
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(loadWidthScreenSize())
        //Создаем элементы интерфейса
        self.view.creatingElements([appNameLabel, viewContainer])
        self.viewContainer.creatingElements([loginField, passwordField, loginButton, OfflineLoginButton])
        //Задаем цвет фона
        view.backgroundColor = UIColor.colorBackgroundView
        //Присваиваем названия кнопок
        loginButton.setTitle("Войти", for: .normal)
        OfflineLoginButton.setTitle("Оффлайн режим", for: .normal)
        //Задаем размер шрифта исходя из размера экрана
        appNameLabel.headingfontStyle(String(loadScreenSize()))
    }
    
    //Расстановка элементов (Код надо будет распиать более аккуратно и компактно)
    func createLayoutUIElement() {
        appNameLabel.positionOfElements(nil, 0,
                                        view.leadingAnchor, 20,
                                        view.trailingAnchor, -20,
                                        viewContainer.topAnchor, -50)
        //Задаем положение и размеры контейнера
        viewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewContainer.widthSize(UIScreen.main.bounds.width - 100)
        viewContainer.heightSize(UIScreen.main.bounds.width - 100)
        
        loginField.positionOfElements(viewContainer.topAnchor, ((loadWidthScreenSize()-100) - ((((loadWidthScreenSize()-100)/8)*4)+65))/2,
                                      viewContainer.leadingAnchor, 10,
                                      viewContainer.trailingAnchor, -10,
                                      nil, 0)
        loginField.heightSize((loadWidthScreenSize()-100)/8)
        //
        passwordField.positionOfElements(loginField.bottomAnchor, 15,
                                         loginField.leadingAnchor, 0,
                                         loginField.trailingAnchor, 0,
                                         nil, 0)
        passwordField.heightSize((loadWidthScreenSize()-100)/8)
        //
        loginButton.positionOfElements(passwordField.bottomAnchor, 15,
                                       passwordField.leadingAnchor, 0,
                                       passwordField.trailingAnchor, 0,
                                       nil, 0)
        loginButton.heightSize(((loadWidthScreenSize() - 100)/8)+10)
        //
        OfflineLoginButton.positionOfElements(loginButton.bottomAnchor, 15,
                                              loginButton.leadingAnchor, 0,
                                              loginButton.trailingAnchor, 0,
                                              nil, 0)
        OfflineLoginButton.heightSize(((loadWidthScreenSize()-100)/8)+10)
    }
}
