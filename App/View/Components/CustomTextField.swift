//
//  PATextField.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 27/10/21.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    private var _required: Bool = false
    private var _messageError: String = "Campo Obrigatório"
    private var _validateFunction: ((_ value: String) -> Bool) = { _ in return false }
  
    private let height: CGFloat = 40
    private let bottomLine = UIView()
    private let bottomLineHeight = 1
    private let defaultUnderlineColor = UIColor.white
        
    public var required: Bool {
        get {
            return self._required
        }
        set {
            self._required = newValue
        }
    }
    
    public var messageError: String {
        get {
            return self._messageError
        }
        set {
            self._messageError = newValue
        }
    }
    
    public var validateFunction: (_ value: String) -> Bool {
        get {
            return self._validateFunction
        }
        set {
            self._validateFunction = newValue
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false
        let placeholder = self.placeholder ?? "Preencha o campo"
        let redPlaceholderText = NSAttributedString(string: placeholder,
                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
        self.attributedPlaceholder = redPlaceholderText
        
        self.textColor = UIColor.white
        
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
                
        setupBottomLine()

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupBottomLine() {
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = defaultUnderlineColor

        self.addSubview(bottomLine)
        
        bottomLine.topAnchor.constraint(equalTo: self.bottomAnchor, constant: CGFloat(bottomLineHeight)).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomLine.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: CGFloat(bottomLineHeight)).isActive = true
    }
}
