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
    var nameFF_1_label = calculationLabel()
    var nameFF_2_label = calculationLabel()// Всегда активные элементы
    var nameFF_3_label = calculationLabel()
    lazy var nameFF_4_label = calculationLabel()// не активны пока они не требуются
    lazy var nameFF_5_label = calculationLabel()
    var StringFF1 = ""//  - Ф.И 1 пожарного
    var StringFF2 = "" // - Ф.И 2 пожарного
    var StringFF3 = ""// - Ф.И 3 пожарного
    var StringFF4 = ""// - Ф.И 4 пожарного
    var StringFF5 = ""// - Ф.И 5 пожарного

    //
    let resultPreper = resultController()
    //MARK:
    var titleName = calculationLabel() // [Заголовок]
    var timeLabel = calculationLabel()
    
    //MARK: textField var - переменные поля для ввода текст(изменить в кастом файле)
    // Осталось настроить все фильтры для ввода текста
    var pressureFF_1_textField = customTextField() //
    var pressureFF_2_textField = customTextField()// Всегда активные эелементы
    var pressureFF_3_textField = customTextField() //
    lazy var pressureFF_4_textField = customTextField() // Не активны пока не требуются
    lazy var pressureFF_5_textField = customTextField() //
    
    var timeField = customTextField()
    
    //MARK: Вью для элементов расчетов (Изменить в кастом файле)
    var numbersFFView = calculationViewContainer()
    var timeView = calculationViewContainer()
    
    //MARK: Button var - кнопка для перехода на другой экран
    var calculationWorkButton = UIButton()
    var settingButton = UIButton()  //Для этой кнопки надо сделать отдельный дизайн
    var saveDataButton = UIButton()// Одно из двух. Либо крестик, либо кнопка сохранить
    
    // Под вопросом полный функционал
    
    //MARK: view var - поле которое будет появляться при первом запуске и его составляющие, либо при вызове настроек
    var settingView = calculationViewContainer()
    var numberOfFirefightersTextField = customTextField()
    var numberOfCylinders = customTextField()
    var volumeOfAir =  customTextField()
    
    //MARK: Данная функция содает элементы на на контроллере в зависимости от числа пожарных
    
    func settingViewFunc(_ VC: UIView) {
        settingView.alpha = 0
        
        pressureFF_1_textField.visualSetting(.calculationType)
        pressureFF_2_textField.visualSetting(.calculationType)
        pressureFF_3_textField.visualSetting(.calculationType)
        pressureFF_4_textField.visualSetting(.calculationType)
        pressureFF_5_textField.visualSetting(.calculationType)
        nameFF_1_label.tag = 0
        nameFF_2_label.tag = 1
        nameFF_3_label.tag = 2
        nameFF_4_label.tag = 3
        nameFF_5_label.tag = 4
        timeField.visualSetting(.timeType)
        
        numberOfFirefightersTextField.visualSetting(.numbersFirefighters)
        numberOfCylinders.visualSetting(.numberOfCylinders)
        volumeOfAir.visualSetting(.volumeOfAir)
        
        //MARK: Настройка внешнего вида кнопок
        saveDataButton.settingButtonFunc(.appActiveButtonStyle)
        settingButton.settingButtonFunc(.settingButtonStyle)
        calculationWorkButton.settingButtonFunc(.appActiveButtonStyle)
        VC.creatingElements([settingView])
        settingView.creatingElements([numberOfFirefightersTextField,
                                      numberOfCylinders,
                                      volumeOfAir,
                                      saveDataButton])
        settingView.translatesAutoresizingMaskIntoConstraints = false
        settingView.centerXAnchor.constraint(equalTo: VC.centerXAnchor).isActive = true
        settingView.centerYAnchor.constraint(equalTo: VC.centerYAnchor).isActive = true
        settingView.widthSize(loadWidthScreenSize() * 0.6)
        settingView.heightSize(loadWidthScreenSize() * 0.6)
        //---Временные настройки--
        numberOfFirefightersTextField.placeholder = "Количество ГДЗ"
        numberOfCylinders.placeholder = "Количество баллонов"
        volumeOfAir.placeholder = "Объем баллона"
        saveDataButton.setTitle("Сохранить", for: .normal)
        calculationWorkButton.setTitle("Рассчет", for: .normal)
        //-----Настройки расположения элементов
        numberOfFirefightersTextField.positionOfElements(settingView.topAnchor, 5,
                                                         settingView.leadingAnchor, 5,
                                                         settingView.trailingAnchor, -5,
                                                         nil, 0)
        numberOfCylinders.positionOfElements(numberOfFirefightersTextField.bottomAnchor, ((loadWidthScreenSize() * 0.6) / 10.0),
                                             settingView.leadingAnchor, 5,
                                             settingView.trailingAnchor, -5,
                                             nil, 0)
        volumeOfAir.positionOfElements(numberOfCylinders.bottomAnchor, ((loadWidthScreenSize() * 0.6) / 10.0),
                                       settingView.leadingAnchor, 5,
                                       settingView.trailingAnchor, -5,
                                       nil, 0)
        saveDataButton.positionOfElements(nil, 0,
                                          settingView.leadingAnchor, 5,
                                          settingView.trailingAnchor, -5,
                                          settingView.bottomAnchor, -5)
    }
    
    func addElementToController(_ VC: UIView) {
        VC.creatingElements([numbersFFView,
                             timeView,
                             timeLabel,
                             timeField,
                             calculationWorkButton,
                             titleName,
                             settingButton])
        
        switch returnNumberOfFirefighters(){
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
        //MARK: Присвоение названи лейблам
        nameFF_1_label.text = "Ф.И. ГДЗ 1"
        nameFF_2_label.text = "Ф.И. ГДЗ 2"
        nameFF_3_label.text = "Ф.И. ГДЗ 3"
        nameFF_4_label.text = "Ф.И. ГДЗ 4"
        nameFF_5_label.text = "Ф.И. ГДЗ 5"
        titleName.text =  "Ф.И. Газодымозащитника"
        titleName.textAlignment = .center
        timeLabel.text = "Время включения:"
        timeField.placeholder = convertDateToString(time: Date.now)
        
        //MARK: Расположение Вью для элементов
        numbersFFView.positionOfElements(VC.safeAreaLayoutGuide.topAnchor, 0,
                                         VC.leadingAnchor, 10,
                                         VC.trailingAnchor, -10,
                                         nil, 0)
        timeView.positionOfElements(numbersFFView.bottomAnchor, 30,
                                    numbersFFView.leadingAnchor, 0,
                                    numbersFFView.trailingAnchor, 0,
                                    nil, 0)
        titleName.positionOfElements(numbersFFView.topAnchor, 5,
                                     numbersFFView.leadingAnchor, 5,
                                     settingButton.leadingAnchor, 5,
                                     nil, 0)
        settingButton.positionOfElements(titleName.topAnchor, 0,
                                         nil, 0,
                                         numbersFFView.trailingAnchor, -5,
                                         nil, 0)
        settingButton.heightSize(30)
        settingButton.widthSize(30)
        //MARK: Располодение форм для ввода текста и названия ячеек
        switch returnNumberOfFirefighters() {
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
            nameFF_1_label.positionOfElements(settingButton.bottomAnchor, 20,
                                              titleName.leadingAnchor, 0,
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
        
        switch returnNumberOfFirefighters() {
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
        settingButton.addTarget(self, action: #selector(openSettingView), for: .allEvents)//Действие для кнопки
        saveDataButton.addTarget(self, action: #selector(saveEdithData), for: .touchUpInside)
        calculationWorkButton.addTarget(self, action: #selector(nextViewButton), for: .touchUpInside)
        nameFF_1_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF1)))
        nameFF_2_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF2)))
        nameFF_3_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF3)))
        nameFF_4_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF4)))
        nameFF_5_label.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(newNameFF5)))
    }
    
    @objc func newNameFF1(){
        resultPreper.resultViewRoot.StringFirefighterOne = self.assigningNewName(nameFF_1_label)
        resultPreper.resultViewRoot.StringFirefighterOne = "Yoba"
        resultController().resultViewRoot.StringFirefighterOne = assigningNewName(nameFF_1_label)
        
    }
    @objc func newNameFF2(){
        StringFF2 = assigningNewName(nameFF_2_label)
    }
    @objc func newNameFF3(){
        StringFF3 = assigningNewName(nameFF_3_label)
    }
    @objc func newNameFF4(){
        StringFF4 =  assigningNewName(nameFF_4_label)
    }
    @objc func newNameFF5(){
        StringFF5 =  assigningNewName(nameFF_5_label)
    }
    
    func assigningNewName(_ TF: UILabel)-> String{
        var StringTest = ""
        let actionController = UIAlertController(title: "Внимание", message: "Укажите имя газодымозащитника", preferredStyle: .alert)
        actionController.addTextField { (textField: UITextField) in
            textField.placeholder = TF.text
        }
        actionController.addAction(UIAlertAction(title: "Сохранить ", style: .default, handler: {  alert -> Void in
            TF.text = actionController.textFields![0].text!
            switch TF.tag {
                case 0: self.StringFF1 = actionController.textFields![0].text!
                case 1: self.StringFF2 = actionController.textFields![0].text!
                case 2: self.StringFF3 = actionController.textFields![0].text!
                case 3: self.StringFF4 = actionController.textFields![0].text!
                case 4: self.StringFF5 = actionController.textFields![0].text!
            default: break
            }
        }))
        rootVC?.present(actionController, animated: true, completion: nil)
        return StringTest
        
    }
    
    
    @objc func openSettingView() {
        UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
            self.settingView.alpha = 1
        },completion: nil)
    }
    @objc func nextViewButton() {
        
        switch returnNumberOfFirefighters()  {
        case 5:
            classModel.FF_5 = Int(pressureFF_5_textField.text!)!
            fallthrough
        case 4:
            classModel.FF_4 = Int(pressureFF_4_textField.text!)!
            fallthrough
        case 3:
            classModel.FF_3 = Int(pressureFF_3_textField.text!)!
            fallthrough
        case 2:
            classModel.FF_1 = Int(pressureFF_1_textField.text!)!
            classModel.FF_2 = Int(pressureFF_2_textField.text!)!
        default: break
        }
        classModel.time = timeField.timePicker.date
        classModel.calculation(_ffn: returnNumberOfFirefighters())
        
        resultPreper.RTest = String(classModel.pMin)
        resultPreper.resultViewRoot.timeExit = classModel.delTime
        resultPreper.resultViewRoot.timeWork = classModel.totalTime
        resultPreper.resultViewRoot.numberOfFirefighters = returnNumberOfFirefighters()
        switch returnNumberOfFirefighters() {
        case 5:
            resultPreper.resultViewRoot.FirefighterFive = Double(classModel.FF_5)
            resultPreper.resultViewRoot.StringFirefighterFive = StringFF5
            fallthrough
        case 4:
            resultPreper.resultViewRoot.FirefighterFour = Double(classModel.FF_4)
            resultPreper.resultViewRoot.StringFirefighterFour = StringFF4
            fallthrough
        case 3:
            resultPreper.resultViewRoot.FirefighterThree = Double(classModel.FF_3)
            resultPreper.resultViewRoot.StringFirefighterThree = StringFF3
            fallthrough
        case 2:
            resultPreper.resultViewRoot.FirefighterOne = Double(classModel.FF_1)
            resultPreper.resultViewRoot.StringFirefighterOne = StringFF1
            resultPreper.resultViewRoot.FirefighterTwo = Double(classModel.FF_2)
            resultPreper.resultViewRoot.StringFirefighterTwo = StringFF2
        default:
            break
        }
        resultPreper.resultViewRoot.pExit = classModel.pControlExit
        resultPreper.resultViewRoot.timeWorkClock =  classModel.timeCommand
        resultPreper.resultViewRoot.timeExitClock = classModel.timeFacticalExit
        
//rootVC?.modal.TransitionStyle = .scroll
        rootVC?.navigationController?.pushViewController(resultPreper, animated: true)
    }
    
    
    @objc func saveEdithData() {
        numberOfFirefightersTextField.checkingTheForm(textFieldCheck.numbersFirefighters)
        numberOfCylinders.checkingTheForm(textFieldCheck.numberOfCylinders)
        volumeOfAir.checkingTheForm(textFieldCheck.volumeOfAir)
        NotificationCenter.default.post(name: NSNotification.Name.init("NumberSave"), object: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, animations: {
            self.settingView.alpha = 0
        },completion: nil)    }
    
    
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
public func convertDateToString(time: Date)-> String!{
    let TimeConvert = Double(time.timeIntervalSince1970)
    let resultTime = Date(timeIntervalSince1970: TimeConvert)
    let timeFormat = DateFormatter()
    timeFormat.dateFormat = "HH:mm"
    let stringTime = timeFormat.string(from: resultTime)
    return stringTime
}


