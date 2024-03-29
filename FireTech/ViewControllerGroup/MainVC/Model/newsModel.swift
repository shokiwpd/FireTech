//
//  newsModel.swift
//  FireTech
//
//  Created by Павел Уланов on 09.02.2023.
//

import Foundation

public let newsDataJSONFile = """
    [{
        "newsTitle": "Новое приложение",
        "newsText": "Чего ждать от нового приложения? Косяков или продвижения? Вот и настал тот момент когда мы запускаем новое приложение!",
        "newsImage": "cellTestImage"
    },
    {
        "newsTitle": "АЦ Урал",
        "newsText": "Новые автоцистерны на базе УРАЛ. Новшество или хорошо забытое старое?",
        "newsImage": "cellTestImage 1"
    }]
"""

struct newsDecodable: Decodable {
    enum Category: String, Decodable {
        case newsTitle, newsText, newsImage
    }
    let newsTitle: String
    let newsText: String
    let newsImage: String
}
public let newsJSONData = newsDataJSONFile.data(using: .utf8)!
