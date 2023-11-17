//
//  MainViewController.swift
//  FireTech
//
//  Created by Павел Уланов on 24.01.2023.
//

import Foundation
import UIKit

//Основной контроллер
class NewsViewController: UIViewController {
   
    
    //Создаем элементы
    //Вызываем класс newsCollectionClass отвечающий за расположение и настройки UICollectionView
    
    let classNewsView = newsView()
    
    override func loadView() {
        super.loadView()
        classNewsView.addViewCollection(view)
    }
    
    //Расстановка элементов на контроллере
    
    override func viewDidLayoutSubviews() {
        classNewsView.layoutViewCollection(view)
    }
    //Основные настройки после создания
    override func viewDidLoad() {
        super.viewDidLoad()
        classNewsView.rootVC = self

        view.backgroundColor = .green
    }
    /*
     Предварительно на данном экране как и в первой версии
     будет расположена новостная лента
     основана будет на UICollectionView
     */
}
