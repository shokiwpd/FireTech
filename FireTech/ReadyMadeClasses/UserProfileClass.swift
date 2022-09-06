//
//  UserProfileClass.swift
//  FireTech
//
//  Created by Павел Уланов on 29.08.2022.
//

import Foundation
// Личные данные пользователя для взаимодействия с ним. Храняться локально по умолчанию
class PersonalUserInfo {
    var userName: String! // Имя пользователя
    var userSurname: String! // Фамилия пользователя
    var userMiddleName: String! // Отчество пользователя
    var userBirthday: String! // День рождения пользователя
    var userCity: String! // Город проживания пользователя
}
// Рабочие данные пользователя для взаимодействия с ним. Храняться локально по умолчанию
class WorkersUserInfo {
    var fireStationNumber: String! // Номер пожарной станции
    var post: String! // Должность пользователя
    var typeOfDevice: String! // Типа аппарата
    var theCompanyOfTheDevice: String! // Марка аппарата
}
