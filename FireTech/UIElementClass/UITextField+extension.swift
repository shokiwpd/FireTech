//
//  UITextField+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 28.08.2022.
//

import Foundation
import UIKit

extension UITextField {
        
}
//класс формы для логина
class loginTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        borderStyle = .roundedRect
        backgroundColor = .colorTextField
        textContentType = .emailAddress
        keyboardType = .emailAddress
        clearButtonMode = .always
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class fieldForCalculations: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        borderStyle = .roundedRect 
        backgroundColor = .colorTextField
        textContentType = .flightNumber
        keyboardType = .decimalPad
        clearButtonMode = .whileEditing
        translatesAutoresizingMaskIntoConstraints = false
        widthSize(100)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
//класс формы для пароля
class passwordTextField : UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        borderStyle = .roundedRect
        textContentType = .password
        isSecureTextEntry = true
        backgroundColor =  .colorTextField
        clearButtonMode = .always
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
