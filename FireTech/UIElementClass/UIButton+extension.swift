//
//  UIButton+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 28.08.2022.
//

import Foundation
import UIKit

public enum buttonStyleCategory {
    case appActiveButtonStyle
    case settingButtonStyle
}

extension UIButton {
    func settingButtonFunc(_ bs: buttonStyleCategory){
        switch bs {
        case .appActiveButtonStyle:
            setTitleColor(.colorText, for: .normal)
            backgroundColor = .mediumColorBackgroundView
            layer.cornerRadius = 10
            layer.borderWidth = 0.5
            layer.borderColor = UIColor.gray.cgColor
            clipsToBounds = true
            layer.masksToBounds = false
        case .settingButtonStyle:
            setImage(UIImage(named: "setting"), for: .normal)
            backgroundColor = .clear
        }
    }
}

