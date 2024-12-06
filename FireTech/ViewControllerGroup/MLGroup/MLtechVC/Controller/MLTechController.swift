//
//  MLTechController.swift
//  FireTech
//
//  Created by Павел Уланов on 27.11.2024.
//

import UIKit
import CoreML
import Vision
import AVKit


class MLTechController: UIViewController {
    let classMLView = MLTechView()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreML"
        classMLView.MLTechControllerRoot = self
        classMLView.startAllFunc(view)
    }
}
    
  
