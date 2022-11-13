//
//  AuthorizationViewController.swift
//  FireTech
//
//  Created by Павел Уланов on 02.09.2022.
//

import Foundation
import UIKit


class AuthorizationViewController: UIViewController {
    
    //MARK: Объявление элементов интерфейса
    let appNameLabel = headingLabel()
    let viewContainer = customViewContainer()
    let loginField = loginTextField()
    let passwordField = passwordTextField()
    let loginButton = appActiveButton()
    let OfflineLoginButton = appClearButton()

    override func viewDidLayoutSubviews() {
        //MARK: Задаем положение элементов на экране
        createLayoutUIElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: Создаем элементы интерфейса
        self.view.creatingElements([appNameLabel, viewContainer])
        self.viewContainer.creatingElements([loginField, passwordField, loginButton, OfflineLoginButton])
        //MARK: Задаем цвет фона
        view.backgroundColor = UIColor.colorBackgroundView
        //MARK: Присваиваем названия кнопок
        loginField.delegate = self
        passwordField.delegate = self
        loginButton.setTitle("Войти", for: .normal)
        OfflineLoginButton.setTitle("Оффлайн режим", for: .normal)
        //MARK: Задаем размер шрифта исходя из размера экрана
        appNameLabel.headingfontStyle(String(loadScreenSize()))
        addTarget()
    }
    
    //MARK: Расстановка элементов (Код надо будет распиать более аккуратно и компактно)
    func addTarget(){
        loginButton.addTarget(self, action: #selector(userAuthorizationFunction), for: .touchDown)
        OfflineLoginButton.addTarget(self, action: #selector(registrationAlert), for: .touchDown)
    }
    
    //MARK: Функция расставляющая элементы внутри контроллера
    func createLayoutUIElement() {
        appNameLabel.positionOfElements(nil, 0,
                                        view.leadingAnchor, 20,
                                        view.trailingAnchor, -20,
                                        viewContainer.topAnchor, -50)
        //MARK: Задаем положение и размеры контейнера
        viewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
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
    
    //MARK: проверка полей на наличие текста (При подключении к БД будет обработка вода и ошибок)
   @objc func userAuthorizationFunction(){
       if loginField.text! != "" {
           if passwordField.text! != "" {
               print("User name: \(loginField.text!) select password \(passwordField.text!)")
            }
        }
    }

    //MARK: Функция которая предупреждает пользователя о регистрации для сохранения данных в облаке
   @objc func registrationAlert() {
        let alertConttroller = UIAlertController(title: "Внимание", message: "Без регистрации все данные в приложении будут удалены после переустановки. Хотите продолжить?", preferredStyle: .alert)
       alertConttroller.addAction(UIAlertAction.init(title: "Регистрация", style: .default))
       alertConttroller.addAction(UIAlertAction.init(title: "Продолжить без регистрации", style: .destructive, handler: { [self] (action) in
            offlineWork()
        }))
        present(alertConttroller, animated: true)
    }
    
    //MARK: функция переход на следующий рабчоий экран
    func offlineWork(){
        let openTabbar = mainTabBarController()
        openTabbar.modalTransitionStyle = .crossDissolve
        openTabbar.modalPresentationStyle = .fullScreen
        present(openTabbar, animated: true, completion: nil)
    }
}

    //MARK: Настройка полей ввода текста(Пока примерный фильтр на поля)
extension AuthorizationViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var filterString = ""
        if textField == loginField {
            filterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz@.()_-"
        }
        if textField == passwordField {
            filterString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
        }
        // remove non-numerics and compare with original string
        return string == string.filter(filterString.contains)

    }
    
}
