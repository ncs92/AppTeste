//
//  PATextView.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 27/10/21.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


