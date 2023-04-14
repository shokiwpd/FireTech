//
//  AuthorizationView.swift
//  FireTech
//
//  Created by Павел Уланов on 02.04.2023.
//

import Foundation
import UIKit

class AuthorizationViewSetting: UIView, UITextFieldDelegate {
    //MARK: Create UIKIt elements
    let appNameLabel = headingLabel()
    let viewContainer = customViewContainer()
    let loginField = loginTextField()
    let passwordField = passwordTextField()
    let loginButton = appActiveButton()
    let OfflineLoginButton = appClearButton()
    
    weak var rootVC: AuthorizationViewController?
    
    //MARK: add elements to view
    func createElementToView(_ VC: UIView){
        VC.creatingElements([appNameLabel, viewContainer])
        viewContainer.creatingElements([loginField, passwordField, loginButton, OfflineLoginButton])
    }
    
    //MARK: layout setting to view
    func createLayoutUIElement(_ VC: UIView) {
        loginField.delegate = self
        passwordField.delegate = self
        
        appNameLabel.positionOfElements(nil, 0,
                                        VC.leadingAnchor, 20,
                                        VC.trailingAnchor, -20,
                                        viewContainer.topAnchor, -50)
        
        //MARK: Задаем положение и размеры контейнера
        viewContainer.centerYAnchor.constraint(equalTo: VC.centerYAnchor).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: VC.centerXAnchor).isActive = true
        viewContainer.widthSize(UIScreen.main.bounds.width - 100)
        viewContainer.heightSize(UIScreen.main.bounds.width - 100)
        
        //MARK: Настройка расположения поля ввода логина
        loginField.positionOfElements(viewContainer.topAnchor, ((loadWidthScreenSize()-100) - ((((loadWidthScreenSize()-100)/8)*4)+65))/2,
                                      viewContainer.leadingAnchor, 10,
                                      viewContainer.trailingAnchor, -10,
                                      nil, 0)
        loginField.heightSize((loadWidthScreenSize()-100)/8)
        //MARK: Настройка расположения поля ввода пароля
        passwordField.positionOfElements(loginField.bottomAnchor, 15,
                                         loginField.leadingAnchor, 0,
                                         loginField.trailingAnchor, 0,
                                         nil, 0)
        passwordField.heightSize((loadWidthScreenSize()-100)/8)
        //MARK: Настройка расположения кнопки авторизации
        loginButton.positionOfElements(passwordField.bottomAnchor, 15,
                                       passwordField.leadingAnchor, 0,
                                       passwordField.trailingAnchor, 0,
                                       nil, 0)
        loginButton.heightSize(((loadWidthScreenSize() - 100)/8)+10)
        //MARK: Настройка расположения кнопки оффлайн режима
        OfflineLoginButton.positionOfElements(loginButton.bottomAnchor, 15,
                                              loginButton.leadingAnchor, 0,
                                              loginButton.trailingAnchor, 0,
                                              nil, 0)
        OfflineLoginButton.heightSize(((loadWidthScreenSize()-100)/8)+10)
    }
    func displaySetting(){
        loginButton.setTitle("Войти", for: .normal)
        OfflineLoginButton.setTitle("Оффлайн режим", for: .normal)
        appNameLabel.headingfontStyle(String(loadScreenSize()))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        loginField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return true
    }
    
    func addsButtonAction(){
        loginButton.addTarget(self, action: #selector(loginsToApp), for: .touchDown)
        OfflineLoginButton.addTarget(self, action: #selector(enteringOfflineMode), for: .touchDown)
    }
    
    @objc func loginsToApp(){
        print(loginField.text!)
    }
    @objc func enteringOfflineMode(){
        let tabbarVC = mainTabBarController()
        tabbarVC.modalTransitionStyle = .flipHorizontal
        tabbarVC.modalPresentationStyle = .fullScreen
        rootVC!.present(tabbarVC, animated: true, completion: nil)
    }
    
}


