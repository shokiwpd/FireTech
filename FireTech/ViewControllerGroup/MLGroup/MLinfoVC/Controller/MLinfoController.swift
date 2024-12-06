//
//  MLinfoController.swift
//  FireTech
//
//  Created by Павел Уланов on 05.12.2024.
//

import UIKit


class MLinfoController: UIViewController {
   
    let MLinfoViewClass = MLinfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MLinfoViewClass.rootMLinfo = self
        MLinfoViewClass.addElementToControllerMLInfo(view)
        MLinfoViewClass.createLayoutUIElementML(view)
        
    }
    
}
