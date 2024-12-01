//
//  navigationView.swift
//  FireTech
//
//  Created by Павел Уланов on 15.11.2024.
//

import UIKit


class navigationView: UINavigationController {
    weak var rootVC: navigatinController?
    
    let apperNavigation = UINavigationBarAppearance()

    func customNavigation (_ NC: UINavigationController) {
        apperNavigation.backgroundColor = .mediumColorBackgroundView
        NC.navigationBar.standardAppearance = apperNavigation
        NC.navigationBar.scrollEdgeAppearance = apperNavigation
        NC.navigationBar.isTranslucent = false
        NC.navigationBar.prefersLargeTitles = true
        NC.navigationBar.compactAppearance = .none
        NC.navigationBar.backgroundColor = .mediumColorBackgroundView
    }
    func profileButton(buttonsProfile: UINavigationItem) {
        buttonsProfile.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settingCalc"), style: .plain, target: nil, action: nil)
        }
}
extension navigationControllers: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        let NI = navigationView()
        NI.profileButton(buttonsProfile: viewController.navigationItem)

    }
}
