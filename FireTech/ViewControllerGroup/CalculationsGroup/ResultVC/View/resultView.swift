//
//  resultView.swift
//  FireTech
//
//  Created by Павел Уланов on 14.10.2024.
//
import UIKit

class resultView: UIView {
    //MARK: Root
    weak var rootVC: resultController?
    //MARK: UIKit
    let resultViewContainer = UIView()//Окно с результатами
    let detailButton = UIButton()//Кнопка чтобы посмотреть детализацию расчетов
    var resultationLabel = UILabel()
    var labelTimeWork = workResultation() // - Табло с отсчетом общего времени
    var labelExitCommand = workResultation()// - Табло с отсчетом времени до подачи команды звена
    var labelTimeExitAndWork = workResultation()// - Табло с временем выхода и временем подачи команды
    var labelPressure = workResultation()// - Табло с Давлением
    var firefighterNameView = calculationViewContainer()
    var informationView = calculationViewContainer()
    //MARK: Timer
    var timerActiveWork = Timer()
    var timerActiveExit = Timer()
    var barTimer = Timer()
    //MARK: Double
    var barFirefighters = 0.0
    var FirefighterOne = 0.0//  - Ф.И 1 пожарного
    var FirefighterTwo = 0.0 // - Ф.И 2 пожарного
    var FirefighterThree = 0.0// - Ф.И 3 пожарного
    var FirefighterFour = 0.0// - Ф.И 4 пожарного
    var FirefighterFive = 0.0// - Ф.И 5 пожарного
    //MARK: Integer
    var timeWork = 0
    var timeExit = 0
    var pExit = 0
    var numberOfFirefighters = 0
    //MARK: String
    var timeWorkClock = ""
    var timeExitClock = ""
    var StringFirefighterOne = ""//  - Ф.И 1 пожарного
    var StringFirefighterTwo = "" // - Ф.И 2 пожарного
    var StringFirefighterThree = ""// - Ф.И 3 пожарного
    var StringFirefighterFour = ""// - Ф.И 4 пожарного
    var StringFirefighterFive = ""// - Ф.И 5 пожарного
    var labelFirefighterOne = workResultation()//  - Ф.И 1 пожарного
    var labelFirefighterTwo = workResultation() // - Ф.И 2 пожарного
    var labelFirefighterThree = workResultation()// - Ф.И 3 пожарного
    var labelFirefighterFour = workResultation()// - Ф.И 4 пожарного
    var labelFirefighterFive = workResultation()// - Ф.И 5 пожарного
    //MARK: Function
    func creatingElementInView(_ VC: UIView){
        switch numberOfFirefighters {
        case 5:
            VC.creatingElements([firefighterNameView,
                                 informationView,
                                 labelFirefighterOne,
                                 labelFirefighterTwo,
                                 labelFirefighterThree,
                                 labelFirefighterFour,
                                 labelFirefighterFive,
                                 labelTimeWork,
                                 labelExitCommand,
                                 labelTimeExitAndWork,
                                 labelPressure])
        case 4:
            VC.creatingElements([firefighterNameView,
                                 informationView,
                                 labelFirefighterOne,
                                 labelFirefighterTwo,
                                 labelFirefighterThree,
                                 labelFirefighterFour,
                                 labelTimeWork,
                                 labelExitCommand,
                                 labelTimeExitAndWork,
                                 labelPressure])
        case 3:
            VC.creatingElements([firefighterNameView,
                                 informationView,
                                 labelFirefighterOne,
                                 labelFirefighterTwo,
                                 labelFirefighterThree,
                                 labelTimeWork,
                                 labelExitCommand,
                                 labelTimeExitAndWork,
                                 labelPressure])
        case 2:
            VC.creatingElements([firefighterNameView,
                                 informationView,
                                 labelFirefighterOne,
                                 labelFirefighterTwo,
                                 labelTimeWork,
                                 labelExitCommand,
                                 labelTimeExitAndWork,
                                 labelPressure])
        default: break
        }
    }
    
    
    func arrangementOfElementInView(_ VC: UIView){
        labelTimeWork.text = " Время выхода: \(timeWork) Мин"
        labelExitCommand.text = " Время подачи:\(timeExit) Мин"
        labelTimeExitAndWork.text = """
         Звено выйдет в \(timeExitClock)
         Подача команды в \(timeWorkClock)
        """
        labelPressure.text = " Давление на выход \(pExit) Бар"
        firefighterNameView.positionOfElements(VC.topAnchor, 10,
                                               VC.leadingAnchor, 0,
                                               VC.trailingAnchor, 0,
                                               nil, 0)
        
        informationView.positionOfElements(firefighterNameView.bottomAnchor, 20,
                                           VC.leadingAnchor, 0,
                                           VC.trailingAnchor, 0,
                                           labelPressure.bottomAnchor, 10)
        switch numberOfFirefighters {
            case 2: firefighterNameView.bottomAnchor.constraint(equalTo: labelFirefighterTwo.bottomAnchor, constant: 10).isActive = true
            case 3: firefighterNameView.bottomAnchor.constraint(equalTo: labelFirefighterThree.bottomAnchor, constant: 10).isActive = true
            case 4: firefighterNameView.bottomAnchor.constraint(equalTo: labelFirefighterFour.bottomAnchor, constant: 10).isActive = true
            case 5: firefighterNameView.bottomAnchor.constraint(equalTo: labelFirefighterFive.bottomAnchor, constant: 10).isActive =  true
        default: break
        }
        
        
        switch numberOfFirefighters {
        case 5:
            labelFirefighterFive.positionOfElements(labelFirefighterFour.bottomAnchor, 0,
                                                    labelFirefighterOne.leadingAnchor , 0,
                                                    labelFirefighterOne.trailingAnchor, 0,
                                                    nil, 0)
            
            if StringFirefighterFive == "" {labelFirefighterFive.text = "Давление 5 пожарного \(Int(FirefighterFive))"} else {labelFirefighterFive.text = "\(StringFirefighterFive) : \(FirefighterFive)"}
            fallthrough
        case 4:
            labelFirefighterFour.positionOfElements(labelFirefighterThree.bottomAnchor, 0,
                                                    labelFirefighterOne.leadingAnchor , 0,
                                                    labelFirefighterOne.trailingAnchor, 0,
                                                    nil, 0)
            
            if StringFirefighterFour == "" {labelFirefighterFour.text = "Давление 4 пожарного \(Int(FirefighterFour))"} else {labelFirefighterFour.text = "\(StringFirefighterFour) : \(FirefighterFour)"}
            fallthrough
        case 3:
            labelFirefighterThree.positionOfElements(labelFirefighterTwo.bottomAnchor, 0,
                                                     labelFirefighterOne.leadingAnchor , 0,
                                                     labelFirefighterOne.trailingAnchor, 0,
                                                     nil, 0)
            if StringFirefighterThree == "" {labelFirefighterThree.text = "Давление 3 пожарного \(Int(FirefighterThree))"} else {labelFirefighterThree.text = "\(StringFirefighterThree) :  \(Int(FirefighterThree))"}
            fallthrough
        case 2:
            labelFirefighterOne.positionOfElements(firefighterNameView.topAnchor, 20,
                                                   firefighterNameView.leadingAnchor, 10,
                                                   firefighterNameView.trailingAnchor, -10,
                                                   nil, 0)
            labelFirefighterTwo.positionOfElements(labelFirefighterOne.bottomAnchor, 0,
                                                   labelFirefighterOne.leadingAnchor , 0,
                                                   labelFirefighterOne.trailingAnchor, 0,
                                                   nil, 0)
            //------
            if StringFirefighterOne == "" {labelFirefighterOne.text = "Давление 1 пожарного \(Int(FirefighterOne))"} else {labelFirefighterOne.text = "\(StringFirefighterOne) :  \(Int(FirefighterOne))"}
            if StringFirefighterTwo == "" {labelFirefighterTwo.text = "Давление 2 пожарного \(Int(FirefighterTwo))"} else {labelFirefighterTwo.text = "\(StringFirefighterTwo) :  \(Int(FirefighterTwo))"}

        default:
            break
        }
        
        
        labelTimeWork.positionOfElements(informationView.topAnchor, 20,
                                         informationView.leadingAnchor, 0,
                                         informationView.trailingAnchor, 0,
                                         nil, 0)
        labelExitCommand.positionOfElements(labelTimeWork.bottomAnchor,0,
                                            informationView.leadingAnchor, 0,
                                            informationView.trailingAnchor, 0,
                                            nil, 0)
        labelTimeExitAndWork.positionOfElements(labelExitCommand.bottomAnchor, 0,
                                                informationView.leadingAnchor, 0,
                                                informationView.trailingAnchor, 0,
                                                nil, 0)
        labelPressure.positionOfElements(labelTimeExitAndWork.bottomAnchor, 0,
                                         informationView.leadingAnchor, 0,
                                         informationView.trailingAnchor, 0,
                                         informationView.bottomAnchor, 20)
    }
    func timerWorkFunc(){
        timerActiveWork = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timerWorkOn), userInfo: nil, repeats: true)
    }
    func timerExitFunc(){
        timerActiveExit = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(timerExitOn), userInfo: nil, repeats: true)
    }
    func barTimerFunc() {
        barTimer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: #selector(barTimerOn), userInfo: nil, repeats: true)
    }
    //MARK: objc function
    @objc func timerWorkOn(){
        timeWork -= 1
        labelTimeWork.text = "Время выхода: \(timeWork) Мин"
        if timeWork == 0 {
            timerActiveWork.invalidate()
        }
    }
    @objc func timerExitOn(){
        timeExit -= 1
        labelExitCommand.text = "Время подачи:\(timeExit) Мин"
        if timeExit == 0 {
            timerActiveExit.invalidate()

        }
    }
    @objc func barTimerOn(){
         FirefighterOne -= 6.75
         FirefighterTwo -= 6.75
         FirefighterThree -= 6.75
         FirefighterFour -= 6.75
         FirefighterFive -= 6.75
        
        if StringFirefighterOne == "" {labelFirefighterOne.text = "Давление 1 пожарного \(Int(FirefighterOne))"} else {labelFirefighterOne.text = "\(StringFirefighterOne) :  \(Int(FirefighterOne))"}
        if StringFirefighterTwo == "" {labelFirefighterTwo.text = "Давление 2 пожарного \(Int(FirefighterTwo))"} else {labelFirefighterTwo.text = "\(StringFirefighterTwo) : \(Int(FirefighterTwo))"}
        if StringFirefighterThree == "" {labelFirefighterThree.text = "Давление 3 пожарного \(Int(FirefighterThree))"} else {labelFirefighterThree.text = "\(StringFirefighterThree) :  \(Int(FirefighterThree))"}
        if StringFirefighterFour == "" {labelFirefighterFour.text = "Давление 4 пожарного \(Int(FirefighterFour))"} else {labelFirefighterFour.text = "\(StringFirefighterFour) : \(FirefighterFour)"}
        if StringFirefighterFive == "" {labelFirefighterFive.text = "Давление 5 пожарного \(Int(FirefighterFive))"} else {labelFirefighterFive.text = "\(StringFirefighterFive) : \(FirefighterFive)"}

    }
}

