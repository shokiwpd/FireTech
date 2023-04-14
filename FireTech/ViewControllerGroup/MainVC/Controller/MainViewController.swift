//
//  MainViewController.swift
//  FireTech
//
//  Created by Павел Уланов on 24.01.2023.
//

import Foundation
import UIKit

//Основной контроллер
class MainViewController: UIViewController {
    //Создаем элементы
    //Вызываем класс newsCollectionClass отвечающий за расположение и настройки UICollectionView
    let newsCollectionView = newsCollectionClass()
    
    override func loadView() {
        super.loadView()
    }
    
    //Расстановка элементов на контроллере
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    //Основные настройки после создания
    override func viewDidLoad() {
        super.viewDidLoad()
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        
        view.backgroundColor = .green
    }
    /*
     Предварительно на данном экране как и в первой версии
     будет расположена новостная лента
     основана будет на UICollectionView
     */
}
