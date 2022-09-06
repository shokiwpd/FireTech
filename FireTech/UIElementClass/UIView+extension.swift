//
//  UIView+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 20.08.2022.
//

import Foundation
import UIKit


extension UIView {
    //функция с настройками положения элементов и включение 
    func positionOfElements(_ top: NSLayoutAnchor<NSLayoutYAxisAnchor>?,
                            _ topConstrant: CGFloat,
                            _ leading: NSLayoutAnchor<NSLayoutXAxisAnchor>?,
                            _ leadingConstant: CGFloat,
                            _ trailing: NSLayoutAnchor<NSLayoutXAxisAnchor>?,
                            _ trailingConstant: CGFloat,
                            _ bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>?,
                            _ bottomConstant: CGFloat){
        //Активация возможности настройки элементов в обход сториборда
        self.translatesAutoresizingMaskIntoConstraints = false
        //Настройка положения верхней части элемента
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstrant).isActive = true
        }
        //Настройка положения левой части элемента
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: leadingConstant).isActive = true
        }
        //Настройка положения правой части элемента
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: trailingConstant).isActive = true
        }
        //Настройка положения нижней части элемента
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant).isActive = true
        }
    }
    //Создание элементов на контроллере
    func creatingElements(_ elementName: [UIView]){
        for sortingElements in elementName {
            self.addSubview(sortingElements)
        }
    }
    func customViewContainer(){
        
    }
}