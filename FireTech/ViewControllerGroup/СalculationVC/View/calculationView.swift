//
//  calculationView.swift
//  FireTech
//
//  Created by Павел Уланов on 23.07.2023.
//

import Foundation
import UIKit

class calculationView: UIView, UIGestureRecognizerDelegate {
    
    weak var rootVC: calculationViewController?
    var classModel = prikaz640()
    //MARK: Label var - переменные текстового окна
    var nameFF_1_label:UILabel = {
        let label = UILabel()
        label.text = "Ф.И. ГДЗ 1"
        label.textColor = .colorText
        label.isUserInteractionEnabled = true
        return label
    }()
    var nameFF_2_label:UILabel = {
        let label = UILabel()
        label.text = "Ф.И. ГДЗ 2"
        label.textColor = .colorText
        label.isUserInteractionEnabled = true
        return label
    }() // Всегда активные элементы
    var nameFF_3_label:UILabel = {
        let label = UILabel()
        label.text = "Ф.И. ГДЗ 3"
        label.textColor = .colorText
        label.isUserInteractionEnabled = true
        return label
    }() //
    lazy var nameFF_4_label:UILabel = {
        let label = UILabel()
        label.text = "Ф.И. ГДЗ 4"
        label.textColor = .colorText
        label.isUserInteractionEnabled = true
        return label
    }() // не активны пока они не требуются
    lazy var nameFF_5_label:UILabel = {
        let label = UILabel()
        label.text = "Ф.И. ГДЗ 5"
        label.textColor = .colorText
        label.isUserInteractionEnabled = true
        return label
    }()
    var timeLabel:UILabel = {
        var label = UILabel()
        label.text = "Время включения:"
        return label
    }()
    
    //MARK: textField var - переменные поля для ввода текст(изменить в кастом файле)
    var pressureFF_1_textField = fieldForCalculations() //
    var pressureFF_2_textField = fieldForCalculations() // Всегда активные эелементы
    var pressureFF_3_textField = fieldForCalculations() //
    lazy var pressureFF_4_textField = fieldForCalculations() // Не активны пока не требуются
    lazy var pressureFF_5_textField = fieldForCalculations() //
    var timeField = loginTextField()
    
    //MARK: Вью для элементов расчетов (Изменить в кастом файле)
    var numbersFFView = calculationViewContainer()
    var timeView = calculationViewContainer()
    
    //MARK: Button var - кнопка для перехода на другой экран
    var calculationWorkButton: appActiveButton = {
        var button = appActiveButton()
        button.setTitle("Рассчет", for: .normal)
        return button
    }()// Под вопросом полный функционал
    
    //MARK: view var - поле которое будет появляться при первом запуске и его составляющие
    var firstSettingView = UIView()
    var volumeOfTheCylinder = UITextField()
    var numberOfCylinders = UITextField()
    var numberOfFirefighters = 5
    var saveDataButton = appActiveButton()
    //------------------------
    //|      UItextField 1   |
    //|      UItextField 2   | - Примерный вид окна чтобы не забыть
    //|      UItextField 3   |
    //|        UIButton      |
    //------------------------
    
    //Данная функция содает элементы на на контроллере в зависимости от числа пожарных
    func addElementToController(_ VC: UIView) {
        VC.creatingElements([numbersFFView,
                             timeView,
                             timeLabel,
                             timeField,
                             calculationWorkButton])
        
        switch numberOfFirefighters{
        case 5:
            VC.creatingElements([nameFF_5_label,
                                 pressureFF_5_textField])
            fallthrough
        case 4:
            VC.creatingElements([nameFF_4_label,
                                 pressureFF_4_textField])
            fallthrough
        case 3:
            VC.creatingElements([nameFF_1_label,
                                 nameFF_2_label,
                                 nameFF_3_label,
                                 pressureFF_1_textField,
                                 pressureFF_2_textField,
                                 pressureFF_3_textField])
        default: break
        }
    }
    //Функция которая распределяет элементы на контроллере согласно числу пожарных
    //Как и в случае создания объектов на экране, мы расставляем элементы в нужных местах
    func createLayoutUIElement(_ VC: UIView){
        //MARK: Расположение Вью для элементов
        numbersFFView.positionOfElements(VC.topAnchor, 200,
                                         VC.leadingAnchor, 10,
                                         VC.trailingAnchor, -10,
                                         nil, 0)
        timeView.positionOfElements(numbersFFView.bottomAnchor, 30,
                                    numbersFFView.leadingAnchor, 0,
                                    numbersFFView.trailingAnchor, 0,
                                    nil, 0)
        
        //MARK: Располодение форм для ввода текста и названия ячеек
        switch numberOfFirefighters {
        case 5:
            //Форма №5
            nameFF_5_label.positionOfElements(nameFF_4_label.bottomAnchor, 20,
                                              nameFF_4_label.leadingAnchor, 0,
                                              nil, 0,
                                              nil, 0)
            pressureFF_5_textField.positionOfElements(nameFF_5_label.topAnchor, 0,
                                                      nameFF_5_label.trailingAnchor, 10,
                                                      numbersFFView.trailingAnchor, -5,
                                                      nil, 0)
            pressureFF_5_textField.widthSize(100)
            fallthrough
        case 4:
            //Форма №4
            nameFF_4_label.positionOfElements(nameFF_3_label.bottomAnchor, 20,
                                              nameFF_3_label.leadingAnchor, 0,
                                              nil, 0,
                                              nil, 0)
            pressureFF_4_textField.positionOfElements(nameFF_4_label.topAnchor, 0,
                                                      nameFF_4_label.trailingAnchor, 10,
                                                      numbersFFView.trailingAnchor, -5,
                                                      nil, 0)
            pressureFF_4_textField.widthSize(100)
            fallthrough
        case 3:
            //Форма №1
            nameFF_1_label.positionOfElements(numbersFFView.topAnchor, 10,
                                              numbersFFView.leadingAnchor, 5,
                                              nil, 0,
                                              nil, 0)
            pressureFF_1_textField.positionOfElements(nameFF_1_label.topAnchor, 0,
                                                      nameFF_1_label.trailingAnchor, 10,
                                                      numbersFFView.trailingAnchor, -5,
                                                      nil, 0)
            //Форма №2
            nameFF_2_label.positionOfElements(nameFF_1_label.bottomAnchor, 20,
                                              nameFF_1_label.leadingAnchor, 0,
                                              nil, 0,
                                              nil, 0)
            pressureFF_2_textField.positionOfElements(nameFF_2_label.topAnchor, 0,
                                                      nameFF_2_label.trailingAnchor, 10,
                                                      pressureFF_1_textField.trailingAnchor, 0,
                                                      nil, 0)
            //Форма №3
            nameFF_3_label.positionOfElements(nameFF_2_label.bottomAnchor, 20,
                                              nameFF_2_label.leadingAnchor, 0,
                                              nil, 0,
                                              nil, 0)
            pressureFF_3_textField.positionOfElements(nameFF_3_label.topAnchor, 0,
                                                      nameFF_3_label.trailingAnchor, 10,
                                                      pressureFF_2_textField.trailingAnchor, 0,
                                                      nil,0)
        default: print("Error")
        }
        //MARK: Вью для таймера
        timeLabel.positionOfElements(timeView.topAnchor, 10,
                                     timeView.leadingAnchor, 5,
                                     nil, 0,
                                     timeView.bottomAnchor, -10)
        timeField.positionOfElements(timeLabel.topAnchor, 0,
                                     timeLabel.trailingAnchor, 10,
                                     timeView.trailingAnchor, -5,
                                     timeLabel.bottomAnchor, 0)
        timeField.widthSize(100)
        //MARK: Расположение кнопки для проведения расчетов
        calculationWorkButton.positionOfElements(timeView.bottomAnchor, 30,
                                                 timeView.leadingAnchor, 0,
                                                 timeView.trailingAnchor, 0,
                                                 nil, 0)
        
        switch numberOfFirefighters {
        case 3:
            pressureFF_3_textField.bottomAnchor.constraint(equalTo: numbersFFView.bottomAnchor, constant: -10).isActive = true
        case 4:
            pressureFF_4_textField.bottomAnchor.constraint(equalTo: numbersFFView.bottomAnchor, constant: -10).isActive = true
        case 5:
            pressureFF_5_textField.bottomAnchor.constraint(equalTo: numbersFFView.bottomAnchor, constant: -10).isActive = true
        default: break
        }
        
        calculationWorkButton.heightSize(50)//Высота кнопки
        
    }
    func actionFunc(){
        calculationWorkButton.addTarget(self, action: #selector(printTest), for: .allEvents)//Действие для кнопки
        nameFF_1_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF1)))
        nameFF_2_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF2)))
        nameFF_3_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF3)))
        nameFF_4_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF4)))
        nameFF_5_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF5)))
    }
    
    @objc func newNameFF1(){
        assigningNewName(nameFF_1_label)
    }
    @objc func newNameFF2(){
        assigningNewName(nameFF_2_label)
    }
    @objc func newNameFF3(){
        assigningNewName(nameFF_3_label)
    }
    @objc func newNameFF4(){
        assigningNewName(nameFF_4_label)
    }
    @objc func newNameFF5(){
        assigningNewName(nameFF_5_label)
    }
    
    func assigningNewName(_ TF: UILabel){
        let actionController = UIAlertController(title: "Внимание", message: "Укажите имя газодымозащитника", preferredStyle: .alert)
        actionController.addTextField { (textField: UITextField) in
            textField.placeholder = TF.text
        }
        actionController.addAction(UIAlertAction(title: "Save", style: .default, handler: { alert -> Void in
            TF.text = actionController.textFields![0].text!
        }))
        rootVC?.present(actionController, animated: true, completion: nil)    }
    
    
    @objc func printTest() {
        print("test")
    }
    
    func calculationsTime(time: Date, toTime: Int)-> String!{
        let TimeConvert = Double(time.timeIntervalSince1970) + Double(toTime * 60)
        let resultTime = Date(timeIntervalSince1970: TimeConvert)
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "HH:mm"
        let stringTime = timeFormat.string(from: resultTime)
        return stringTime
    }
    
    func checkData() {
        //MARK: Временное решения для проверки памяти на наличие данных
        func alerts() {
            let alertController = UIAlertController(title: "Внимание", message: "Укажите объем баллона", preferredStyle: .alert)
            alertController.addTextField { (textField: UITextField ) in
                textField.placeholder = "Объем баллона"
            }
            alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: {  alert in
                let text = alertController.textFields![0]
                FireTech.volumeOfTheCylinder(Double(text.text!)!)
                
            }))
            rootVC!.present(alertController, animated: true, completion: nil)
        }
        
        if returnVolumeOfTheCylinder() == 0.0 {
            alerts()
        }
    }
}


