//
//  calculationController.swift
//  FireTech
//
//  Created by Павел Уланов on 23.07.2023.
//

import Foundation
import UIKit

class calculationViewController: UIViewController, UISearchBarDelegate {
    
    let classView = calculationView()
    
    override func loadView() {
        super.loadView()
        classView.addElementToController(view)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classView.createLayoutUIElement(view)
        classView.rootVC = self
        classView.checkData()
        view.backgroundColor = .colorBackgroundView
        classView.settingViewFunc(view)
        title = "Расчеты"
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        searchBar.showsCancelButton = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        classView.actionFunc()
    }
    
    
    
}


