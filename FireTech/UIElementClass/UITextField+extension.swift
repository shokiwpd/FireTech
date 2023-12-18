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
//MARK: Поле для ввода данных о количестве воздеха
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
        hideKeyboard()
        widthSize(100)
    }
    
    
    private func hideKeyboard() {
        let toolBar = hideKeyboardBar()
        inputAccessoryView = toolBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonAction(_:)))
        toolBar.setItems([doneButton], animated: true)
        toolBar.barStyle = .black
    }
    
    @objc func doneButtonAction(_ sender: UIBarButtonItem){
        endEditing(true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class fieldForCalculationsSetting: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        borderStyle = .roundedRect
        backgroundColor = .colorTextField
        textContentType = .flightNumber
        keyboardType = .decimalPad
        clearButtonMode = .whileEditing
        translatesAutoresizingMaskIntoConstraints = false
        hideKeyboard()
    }
    
    
    private func hideKeyboard() {
        let toolBar = hideKeyboardBar()
        inputAccessoryView = toolBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonAction(_:)))
        toolBar.setItems([doneButton], animated: true)
        toolBar.barStyle = .black
    }
    
    @objc func doneButtonAction(_ sender: UIBarButtonItem){
        endEditing(true)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//MARK: Создание toolBar'а для форм ввода текста
class hideKeyboardBar: UIToolbar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: Поле для выбора времени
class timeTextFieldClass: UITextField, UITextFieldDelegate {
    
    let timePicker:UIDatePicker = {
        let time = UIDatePicker()
        time.datePickerMode = .time
        time.preferredDatePickerStyle = .wheels
        return time
    }()
    let toolBar:UIToolbar = {
        let bar = UIToolbar()
        bar.sizeToFit()
        return bar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        backgroundColor = .colorTextField
        delegate = self
        borderStyle = .roundedRect
        inputView = timePicker
        translatesAutoresizingMaskIntoConstraints = false
        hideKeyboard()
    }
    private func hideKeyboard() {
        inputAccessoryView = toolBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonAction(_:)))
        toolBar.setItems([doneButton], animated: true)
        toolBar.barStyle = .black
    }
    
    @objc func doneButtonAction(_ sender: UIBarButtonItem){
        endEditing(true)
        text = convertDateToString(time: timePicker.date)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

