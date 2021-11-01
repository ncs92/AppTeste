//
//  ValidationService.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 29/10/21.
//

import Foundation

class ValidationHelper {
    static let EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"
    static let NOME_REGEX = "^[a-zA-Zà-úÀ-Ú]{3,}([ ]+[a-zA-Zà-úÀ-Ú]+)*([ ]+[a-zA-Zà-úÀ-Ú]{2,})+$"
    static let PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    
    static func validateEmail(_ email: String?) -> Bool {
        guard let emailValue = email else { return false }
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", EMAIL_REGEX);
        return emailTest.evaluate(with: emailValue)
    }
    
    static func validateName(_ name: String?) -> Bool {
        guard let nameValue = name else { return false }
        
        let nameTest = NSPredicate(format:"SELF MATCHES %@", NOME_REGEX);
        return nameTest.evaluate(with: nameValue)
    }
    
    static func validateConfirmPassword(password: String?, confirmPassword: String?) -> Bool {
        guard let passwordValue = password else { return false }
        guard let confirmPasswordValue = confirmPassword else { return false }
        
        if passwordValue.isEmpty || confirmPasswordValue.isEmpty {
            return false
        }
        
        return passwordValue == confirmPasswordValue
    }
    
    static func validatePassword(_ password: String?) -> Bool {
        guard let passwordValue = password else { return false }
        
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", PASSWORD_REGEX);
        return passwordTest.evaluate(with: passwordValue)
    }
    
    static func validateCPF(_ cpf: String?) -> Bool {
        guard let cpfValue = cpf else { return false }
        
        if cpfValue.count != 11 {
            return false
        }
        return true
    }
    
    static func validatePhoneNumber(_ phoneNumber: String?) -> Bool {
        guard let phoneNumberValue = phoneNumber else { return false }
        
        if phoneNumberValue.count != 11 {
            return false
        }
        return true
    }
}
