//
//  PAButton.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 28/10/21.
//

import Foundation
import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.secondary()
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.layer.cornerRadius = 10.0
        self.contentEdgeInsets = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
