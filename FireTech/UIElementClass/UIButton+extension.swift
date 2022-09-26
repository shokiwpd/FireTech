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
        setTitleColor(.black, for: .normal)
        backgroundColor = .green
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class appClearButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(.black, for: .normal)
        backgroundColor = .clear
        layer.borderWidth = 1
        layer.borderColor = CGColor(red: 255, green: 255, blue: 0, alpha: 1)
        layer.cornerRadius = 5
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
