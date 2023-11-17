//
//  CalculatedClass.swift
//  FireTech
//
//  Created by Павел Уланов on 29.08.2022.
//

import Foundation
//Стандартные данные для расчетов 
class StandartCalculatedData {
    let averageAirConsumption_640 = 45.0   // по 640 приказу МЧС РФ
    let averageAirConsumption_3 = 40      // расход воздуха по методическим рекомендациям
    let compressionRatio_640 = 1.1 // коэффициент сжатия
    let stockForTheGearbox = 10    // запас на редуктор
    
}
//Принимает объем баллона и сохраняет в память приложения до его удаления с телефона
public func volumeOfTheCylinder(_ volume: Double){
    UserDefaults.standard.setValue(volume, forKey: "volumeOfTheCylinder")
}
//Возвращает данные сохраненые в приложении
public func returnVolumeOfTheCylinder() -> Double {
    return UserDefaults.standard.double(forKey: "volumeOfTheCylinder")
}
