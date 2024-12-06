//
//  MLinfoView.swift
//  FireTech
//
//  Created by Павел Уланов on 05.12.2024.
//
import UIKit

class MLinfoView: UIView {
    
    weak var rootMLinfo: MLinfoController?
    
    var InformationText = ""
    let textViewML = UITextView()
    
    
    func addElementToControllerMLInfo(_ VC: UIView) {
        VC.creatingElements([textViewML])
    }
    func createLayoutUIElementML(_ VC: UIView) {
        textViewML.positionOfElements(VC.topAnchor, 0,
                                      VC.leadingAnchor, 0,
                                      VC.trailingAnchor, 0,
                                      VC.bottomAnchor, 0)
        
        if let urlListJSON = JSONlistInfo {
            do {
                let data = try Data(contentsOf: urlListJSON)
                let JSONData = try JSONDecoder().decode([infoMLStruct].self, from: data)

                for name in JSONData {
                    if name.name == InformationText {
                        textViewML.text = name.description
                        rootMLinfo?.title = name.name
                        break
                    }
                    
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
}
