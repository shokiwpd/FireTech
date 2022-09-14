//
//  AuthorizationViewController.swift
//  FireTech
//
//  Created by Павел Уланов on 02.09.2022.
//

import Foundation
import UIKit


class AuthorizationViewController: UIViewController {
    
    let appNameLabel = headingLabel()
    let viewContainer: UIView = {
        let viewes = UIView()
        viewes.translatesAutoresizingMaskIntoConstraints = false
            viewes.backgroundColor = .red
        return viewes
    }()
    let loginField = headingLabel() // Временно лейбл
    let passwordField = UITextField()
    let loginButton = UIButton()
    let OfflineLoginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.creatingElements([appNameLabel, viewContainer])
        self.viewContainer.creatingElements([loginField])
        createLayoutUIElement()
    }
    func createLayoutUIElement() {
        appNameLabel.positionOfElements(nil, 0,
                                        view.leadingAnchor, 20,
                                        view.trailingAnchor, -20,
                                        viewContainer.topAnchor, -50)
        viewContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        viewContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        viewContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        viewContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginField.positionOfElements(viewContainer.topAnchor, 20,
                                      viewContainer.leadingAnchor, 20,
                                      viewContainer.trailingAnchor, -20,
                                      nil, 0)
        
    }
    func getSizeScreen(){
        
    }
}
