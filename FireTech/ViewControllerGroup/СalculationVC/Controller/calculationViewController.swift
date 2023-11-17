//
//  calculationController.swift
//  FireTech
//
//  Created by Павел Уланов on 23.07.2023.
//

import Foundation
import UIKit

class calculationViewController: UIViewController, UIGestureRecognizerDelegate {
    
    let classView = calculationView()
    
    override func loadView() {
        super.loadView()
        classView.addElementToController(view)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        classView.createLayoutUIElement(view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        classView.rootVC = self
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
    
}


