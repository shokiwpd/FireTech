//
//  calculationModel.swift
//  FireTech
//
//  Created by Павел Уланов on 23.07.2023.
//

import Foundation

class prikaz640 {
    //Входные данные
    var FF_1 = Int()
    var FF_2 = Int()
    var FF_3 = Int()
    lazy var FF_4 = Int()
    lazy var FF_5 = Int()
    var time = Date()
    //Промежуточные данные
    var pMin = 0
    var volumeBallons = 6.8//returnVolumeOfTheCylinder()
    var averageAirConsumption = 45.0// StandartCalculatedData().averageAirConsumption_640
    var numberOfFirefighters = 0
    //Итоги решения
    var pMaxDown = 0
    var pControlExit = 0
    var delTime = 0
    var timeCommand = 0
    var totalTime = 0
    var timeFacticalExit = 0
    
    func calculation() {
        
            switch numberOfFirefighters {
                case 2:pMin = [FF_1,FF_2].min()!
                case 3:pMin = [FF_1,FF_2,FF_3].min()!
                case 4:pMin = [FF_1,FF_2,FF_3,FF_4].min()!
                case 5:pMin = [FF_1,FF_2,FF_3,FF_4,FF_5].min()!
            default: break
            }
        
        pMaxDown = pMin / 3
        
        pControlExit = pMin - pMaxDown
        
        delTime = Int((Double(pMaxDown) * volumeBallons) / averageAirConsumption)
        
        //        timeCommand =
        
        totalTime = Int((Double(pMin) * volumeBallons) / averageAirConsumption)
        
        //        timeFacticalExit =
        print("\(pMin),\(pMaxDown),\(pControlExit),\(totalTime),\(delTime)")
    }
}
