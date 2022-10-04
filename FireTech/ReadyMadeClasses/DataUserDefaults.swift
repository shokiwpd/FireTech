//
//  DataUserDefaults.swift
//  FireTech
//
//  Created by Павел Уланов on 14.09.2022.
//

import Foundation
//Функция котоаря получает размер экрана при первом входе(авторизации) и сохраняет на протяжении всей жизни приложения
public func saveScreenSize(_ sizeScreen: Double){
    UserDefaults.standard.set(sizeScreen, forKey: "screenSize")
}
public func saveWidthSize(_ sizeScreenWidth: Double){
    UserDefaults.standard.set(sizeScreenWidth, forKey: "screenSizeWidth")
}
//Функция возвращает сохраненый размер экрана для дальнейшего использования 
public func loadScreenSize() -> Double {
    return UserDefaults.standard.double(forKey: "screenSize")
}
public func loadWidthScreenSize() -> Double {
    return UserDefaults.standard.double(forKey: "screenSizeWidth")
}
