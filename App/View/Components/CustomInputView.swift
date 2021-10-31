//
//  CustomInput.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 29/10/21.
//

import Foundation
import UIKit

class CustomInputView: UIView {
    private var _customTextField = CustomTextField()
    private var _hasError: Bool = false
    private let errorLabelView = CustomLabel()
    
    private var _showError: Bool = false {
        didSet { changeStatusShowError() }
    }
    
    public var hasError: Bool {
        get {
            return self._hasError
        }
        set {
            self._hasError = newValue
        }
    }
    
    public var showError: Bool {
        get {
            return self._showError
        }
        set {
            self._showError = newValue
        }
    }
    
    public var customTextField: CustomTextField {
        get {
            return self._customTextField
        }
        set {
            self._customTextField = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(_customTextField)
        self.addSubview(errorLabelView)
//        self.backgroundColor = .yellow
        
        setupLayout()
        
        self._customTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingDidEnd)
        
        self.errorLabelView.textColor = UIColor.secondary()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if (self._customTextField.required) {
            guard let valueTextField = textField.text  else { return }
  
            let isValidFunction = self._customTextField.validateFunction(valueTextField)
          
            print(isValidFunction)
            if (!isValidFunction) {
                self.errorLabelView.text = self._customTextField.messageError
                self.errorLabelView.isHidden = false
//                anchorErrorLabel(isActive: true)
                self._hasError = true
                return
            }
            self.errorLabelView.isHidden = true
//            anchorErrorLabel(isActive: false)
            self._hasError = false
        }
        
    }
    
    private func setupLayout() {
        customTextField.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        customTextField.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        customTextField.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        anchorErrorLabel(isActive: true)
    }
    
    private func anchorErrorLabel(isActive: Bool) {
        errorLabelView.topAnchor.constraint(equalTo: customTextField.bottomAnchor, constant: 10).isActive = isActive
        errorLabelView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = isActive
        errorLabelView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = isActive
        errorLabelView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = isActive
    }
    
    private func changeStatusShowError() {
        if (self._showError) {
            print(self.customTextField.messageError)
            
            errorLabelView.text = self.customTextField.messageError
            self.errorLabelView.isHidden = false
//            anchorErrorLabel(isActive: true)
            self._hasError = true

        } else {
            self.errorLabelView.isHidden = true
//            anchorErrorLabel(isActive: false)
            self._hasError = false
        }
        self.layoutIfNeeded()
        self.setNeedsLayout()
    }
    
}
