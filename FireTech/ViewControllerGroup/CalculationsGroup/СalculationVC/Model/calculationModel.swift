//
//  calculationModel.swift
//  FireTech
//
//  Created by Павел Уланов on 23.07.2023.
//

import Foundation

class prikaz640 {
    //Входные данные
    var FF_1 = 0
    var FF_2 = 0
    var FF_3 = 0
    lazy var FF_4 = 0
    lazy var FF_5 = 0
    var time = Date()
    //Промежуточные данные
    var pMin = 0
    var volumeBallons = returnVolumeOfTheCylinder()
    var averageAirConsumption = StandartCalculatedData().averageAirConsumption_640

    var numberOfFirefighters = 0
    //Итоги решения
    var pMaxDown = 0
    var pControlExit = 0
    var delTime = 0
    var timeCommand = ""
    var totalTime = 0
    var timeFacticalExit = ""
    
    
    
    
    func calculation(_ffn: Int) {
        
            switch _ffn {
                case 2:pMin = [FF_1,FF_2].min()!
                case 3:pMin = [FF_1,FF_2,FF_3].min()!
                case 4:pMin = [FF_1,FF_2,FF_3,FF_4].min()!
                case 5:pMin = [FF_1,FF_2,FF_3,FF_4,FF_5].min()!
            default: break
            }
       
        pMaxDown = pMin / 3
        
        pControlExit = pMin - pMaxDown
        
        delTime = Int((Double(pMaxDown) * volumeBallons) / averageAirConsumption)
        
        timeCommand = calculationsTime(time: time, toTime: delTime)
        
        totalTime = Int((Double(pMin) * volumeBallons) / averageAirConsumption)
        
        timeFacticalExit = calculationsTime(time: time, toTime: totalTime)
        print("\(pMin),\(pMaxDown),\(pControlExit),\(totalTime),\(delTime)")
        
        
    }
    func calculationsTime(time: Date, toTime: Int)-> String!{
            let TimeConvert = Double(Int(time.timeIntervalSince1970) + (toTime * 60))
            let resultTime = Date(timeIntervalSince1970: TimeConvert)
            let timeFormat = DateFormatter()
            timeFormat.dateFormat = "HH:mm"
            let stringTime = timeFormat.string(from: resultTime)
            return stringTime
        }
}
