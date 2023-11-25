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
        classView.checkData()
        classView.actionFunc()
        view.backgroundColor = .colorBackgroundView
        assignbackground()
        
    }
    func assignbackground(){
        let background = UIImage(named: "backView")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.right
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.navigationItem.title = "Расчеты"
    }
    
    
    
}


