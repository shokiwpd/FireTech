//
//  UIColor+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 02.09.2022.
//

import Foundation
import UIKit

//Настройка цветовой гаммы приложения
//Тут будут установлены все цвета приложения

extension UIColor {
    //Цветовая гамма приложения
    //Фоновая/Текстовая цветовая гамма
    static let customWhiteColor = UIColor(red: 255/255,green: 254/255,blue: 252/255,alpha: 1)
    static let customBlackColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
    //Цветвоая гамма для полей ввода текста
    static let customMediumWhiteColor = UIColor(red: 246/255,green: 246/255,blue: 246/255,alpha: 1)
    static let customMediumBlackColor = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)
    //Цветовая гамма для кнопок
    static let customRedColor = UIColor(red: 220/255,green: 13/255,blue: 0/255,alpha: 0.7)
    static let customDarkRedColor = UIColor(red: 204/255, green: 10/255, blue: 0/255, alpha: 1)
    
    //Цветовая гамма будет дополняться если потребуется
    
    //Цветовая гамма для темной и светлой темы
    static let colorBackgroundView = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return customBlackColor
        } else {
            return customWhiteColor
        }
    }
    static let shadowColorBackgroundView = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return customWhiteColor
        } else {
            return customBlackColor
        }
    }

    static let colorText = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return customWhiteColor
        } else {
            return customBlackColor
        }
    }
    static let colorTextField = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return customMediumBlackColor
        } else {
            return customMediumWhiteColor
        }
    }
    static let colorButton = UIColor { (trat: UITraitCollection) -> UIColor in
        if trat.userInterfaceStyle == .dark {
            return customDarkRedColor
        } else {
            return customRedColor
        }
    }
    
    
}
