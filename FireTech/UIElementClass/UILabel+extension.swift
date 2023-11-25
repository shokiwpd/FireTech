//
//  UILabel+extension.swift
//  FireTech
//
//  Created by Павел Уланов on 28.08.2022.
//

import Foundation
import UIKit
 //Тестовые настройки лейбла
extension UILabel {
    //
    func headingfontStyle(_ typeLabel: String) {
            switch loadScreenSize() {
            case 548.0...568.0:
                self.font = UIFont(name:  "Times New Roman", size: 50)//iPhone 5S,SE
            case 647.0...667.0:
                self.font = UIFont(name:  "Times New Roman", size: 70)//iPhone 6,7,8
            case 716.0...736.0:
                self.font = UIFont(name:  "Times New Roman", size: 85)//iPhone 6+,7+,8+
            case 792.0...812.0:
                self.font = UIFont(name:  "Times New Roman", size: 75)//iPhone X,XS,XR,11 Pro,11 Pro Max
            case 926.0...946:
                self.font = UIFont(name:  "Times New Roman", size: 80)//iPhone 12 Max Pro
            case 824.0...844.0:
                self.font = UIFont(name:  "Times New Roman", size: 80)//iPhone 12 Max Pro
            case 876.0...896.0:
                self.font = UIFont(name:  "Times New Roman", size: 85)//iPhone XS_Max,11
            case 1004.0...1024.0:
                self.font = UIFont(name:  "Times New Roman", size: 180)//Air 1,2
            case 1346.0...1366.0:
                self.font = UIFont(name:  "Times New Roman", size: 250)// Pro 12.2
            case 1174.0...1194.0:
                self.font = UIFont(name:  "Times New Roman", size: 200)// Pro 11
            case 1092.0...1112.0:
                self.font = UIFont(name:  "Times New Roman", size: 200)// Pro 10.5
            default: print("_____")
            }
    }
}
//Тестовый класс гланого лейбла
class headingLabel:UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
            text = "FireTech"
            textColor = .colorText
            textAlignment = .center
        }
    required init?(coder: NSCoder) {
            super.init(coder: coder)
            
        }
}

class headerLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        font = UIFont.systemFont(ofSize: 30)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
class initialTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .colorText
        font = UIFont.systemFont(ofSize: 15)
        numberOfLines = 2
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

