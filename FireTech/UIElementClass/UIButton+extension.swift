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
        backgroundColor = .colorButton
        layer.cornerRadius = 5
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
