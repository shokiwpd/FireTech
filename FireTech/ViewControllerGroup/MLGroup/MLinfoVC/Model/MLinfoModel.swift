//
//  MLinfoModel.swift
//  FireTech
//
//  Created by Павел Уланов on 05.12.2024.
//
import Foundation

public let JSONlistInfo = Bundle.main.url(forResource: "namePTV", withExtension: "json")

struct infoMLStruct: Decodable {
    enum Category: String, Decodable {
        case name, description
    }
    let name: String
    let description: String
}
