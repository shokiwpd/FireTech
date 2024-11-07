//
//  UITextField+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 28.08.2022.
//

import Foundation
import UIKit
//Задача упростить и укоротить весь код тут

//Сделать что-то с перечислениями кроме "проверки" на данные
public enum textFieldCheck {
    case calculationType
    case timeType
    case numbersFirefighters
    case numberOfCylinders
    case volumeOfAir
}
extension String {
    func chekingIntegerString(_ st: String) -> Bool {
        self.range(of: st, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

class customTextField: UITextField {
    //MARK: UIDatePicker & UIToolbar
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
    
    //MARK: Инициализация класса
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        borderStyle = .roundedRect
        backgroundColor = .colorTextField
        translatesAutoresizingMaskIntoConstraints = false
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func visualSetting(_ check: textFieldCheck){
        switch check {
        case .calculationType:
            widthSize(100)
            textContentType = .flightNumber
            keyboardType = .decimalPad
            clearButtonMode = .whileEditing
            tag = 0
            hideKeyboard(false)
        case .timeType:
            tag = 1
            widthSize(100)
            inputView = timePicker
            hideKeyboard(true)
        case .numbersFirefighters:
            tag = 2
            textContentType = .flightNumber
            keyboardType = .decimalPad
            clearButtonMode = .whileEditing
            hideKeyboard(false)
        case .numberOfCylinders:
            tag = 3
            textContentType = .flightNumber
            keyboardType = .decimalPad
            clearButtonMode = .whileEditing
            hideKeyboard(false)
        case .volumeOfAir:
            tag = 4
            textContentType = .flightNumber
            keyboardType = .decimalPad
            clearButtonMode = .whileEditing
            hideKeyboard(false)
        }
    }
    private func textCheking(_ tag: Int, _ st: String) {
        //MARK: Шаблоны проверки форм
        let chekingPressure = "^(?=.*\\d)[\\d]{0,3}$"
        let chekingSetting = "^(?=.*\\d)[\\d]{0,1}$"
        
        switch tag {
        case 0:
            if st.chekingIntegerString(chekingPressure) {
                if Int(st)! > 300 {
                    self.text! = "300"
                    self.endEditing(true)}}
            print(st)
        case 1: print("Time")
        case 2:
            if st.chekingIntegerString(chekingSetting) {
                if Int(st)! > 5  {
                    self.text! = "5"
                    self.endEditing(true)
                } else if Int(st)! < 3{
                    self.text! = "3"
                    self.endEditing(true)
                } }
        case 3:
            if st.chekingIntegerString(chekingSetting) {
                if Int(st)! > 2  {
                    self.text! = "2"
                    self.endEditing(true)
                } else if Int(st)! < 1{
                    self.text! = "1"
                    self.endEditing(true)
                } }
        case 4:
            if st.chekingIntegerString(chekingSetting) {
                if Double(st)! > 45.0 {
                    self.text! = "45"
                    self.endEditing(true)
                } else if Double(st)! < 20.0{
                    self.text! = "20"
                    self.endEditing(true)
                } }
        default:
            break
        }
    }
    private func hideKeyboard(_ timeField: Bool) {
        let toolBar = hideKeyboardBar()
        inputAccessoryView = toolBar
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonAction(_:)))
        
        let doneButtonTime = UIBarButtonItem(barButtonSystemItem: .done,
                                         target: self,
                                         action: #selector(doneButtonActionTime(_:)))
        
        timeField ? toolBar.setItems([doneButtonTime], animated: true) : toolBar.setItems([doneButton], animated: true)
    }
    
    @objc func doneButtonAction(_ sender: UIBarButtonItem){
        endEditing(true)
    }
    
    @objc func doneButtonActionTime(_ sender: UIBarButtonItem){
        endEditing(true)
        text = convertDateToString(time: timePicker.date)
    }
}

extension customTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cheking = textField.text! + string
        textCheking(textField.tag, cheking)
        return true
    }
}

extension UITextField {
    func checkingTheForm(_ tft: textFieldCheck) {
        guard self.text != ""  else {return print("Пустая ячейка")}
        switch tft {
        case .calculationType:
            guard Int(self.text!)! >= 260 else {return print("Меньше 260")}
            guard Int(self.text!)! <= 300 else {return print("Больше 300")}
            print(self.text!)
        case .numberOfCylinders:
            guard Int(self.text!)! >= 1 else {return print("Меньше 1")}
            guard Int(self.text!)! <= 2 else {return print("Больше 2")}
        case .numbersFirefighters:
            guard Int(self.text!)! >= 3 else {return print("Меньше 3")}
            guard Int(self.text!)! <= 5 else {return self.text! = "5"}
            numberOfFirefightersSave(Int(text!)!)
        case .timeType:
            guard self.text != ""  else {return print("Пустая ячейка")}
        case .volumeOfAir:
            guard self.text != ""  else {return print("Пустая ячейка")}
        }
    }
}

//MARK: Создание toolBar'а для форм ввода текста
class hideKeyboardBar: UIToolbar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        sizeToFit()
        translatesAutoresizingMaskIntoConstraints = false
        barStyle = .default
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
