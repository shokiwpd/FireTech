//
//  UIButton+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 28.08.2022.
//

import Foundation
import UIKit

extension UIButton {
    
}
//Переименовать в более понятное название кнопки
class appActiveButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.colorText, for: .normal)
        backgroundColor = .colorBackgroundView
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius = 10
        layer.shadowOpacity = 0.5
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowColor = UIColor.systemGray.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class appClearButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.colorText, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = UIColor.colorButton.cgColor
        layer.cornerRadius = 5

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
