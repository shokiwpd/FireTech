//
//  CalculatedClass.swift
//  FireTech
//
//  Created by Павел Уланов on 29.08.2022.
//

import Foundation
//Стандартные данные для расчетов 
struct StandartCalculatedData {
    let averageAirConsumption_640 = 45.0   // по 640 приказу МЧС РФ
    let averageAirConsumption_3 = 40      // расход воздуха по методическим рекомендациям
    let compressionRatio_640 = 1.1 // коэффициент сжатия
    let stockForTheGearbox = 10    // запас на редуктор

    
}
// MARK: Gate UserDefault data
//Число газодымозащитников сохранение в память приложения до его удаления с телефона
public func numberOfFirefightersSave(_ quantity: Int) {
    UserDefaults.standard.setValue(quantity, forKey: "numberOfFirefighters")
}
//Число баллонов сохранение в память приложения до его удаления с телефона
public func numberOfCylinders(_ quantity: Int){
    UserDefaults.standard.setValue(quantity, forKey: "numberOfCylinders")
}
//Режим работы сохранение в память приложения до его удаления с телефона
public func typeOfWork(_ bool: Bool) {
    UserDefaults.standard.setValue(bool, forKey: "typeOfWork")
}
//Принимает объем баллона и сохраняет в память приложения до его удаления с телефона
public func volumeOfTheCylinder(_ volume: Double){
    UserDefaults.standard.setValue(volume, forKey: "volumeOfTheCylinder")
}
// MARK: Return UserDefault data
//Возвращает данные сохраненые в приложении
public func returnVolumeOfTheCylinder() -> Double {
    return UserDefaults.standard.double(forKey: "volumeOfTheCylinder")
}
//Возвращает количество пожарных в звене
public func returnNumberOfFirefighters() -> Int {
    return UserDefaults.standard.integer(forKey: "numberOfFirefighters")
}
//Число баллонов сохранение в память приложения до его удаления с телефона
public func returnNumberOfCylinders()-> Int{
    return UserDefaults.standard.integer(forKey: "numberOfCylinders")
}
//Режим работы сохранение в память приложения до его удаления с телефона
public func returnTypeOfWork()-> Bool {
    return UserDefaults.standard.bool(forKey: "typeOfWork")
}

