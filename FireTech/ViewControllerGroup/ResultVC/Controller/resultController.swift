//
//  resultController.swift
//  FireTech
//
//  Created by Павел Уланов on 14.10.2024.
//

import UIKit

class resultController: UIViewController {
    
    let resultViewRoot = resultView()
    var RTest = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .colorBackgroundView
        resultViewRoot.rootVC = self
        resultViewRoot.creatingElementInView(view)
        resultViewRoot.arrangementOfElementInView(view)
        resultViewRoot.timerWorkFunc()
        resultViewRoot.timerExitFunc()
        resultViewRoot.barTimerFunc()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}
