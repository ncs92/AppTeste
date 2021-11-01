//
//  RegisterViewModel.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 29/10/21.
//

import Foundation
import Alamofire

protocol RegisterProtocol {
    func setMessageInvalidConfirmPassword(_ isValid: Bool)
    func sucessRegister(_ email: String)
    func errorRegister(_ message: String)
}

class RegisterViewModel {
    var delegate: RegisterProtocol?
    
    func validateForm(validateFields: Array<Bool>, password: String?, confirmPassword: String?) -> Bool {
        guard let safeDelegate = delegate else { return false }
   
        if validateFields.contains(true) {
            return false
        }
        
        let validateConfirmPassword = ValidationHelper.validateConfirmPassword(password: password, confirmPassword: confirmPassword)
        
        safeDelegate.setMessageInvalidConfirmPassword(validateConfirmPassword)
        
        return validateConfirmPassword
    }

    
    func requestRegister(name: String, email: String, cpf: String, phoneNumber: String, password: String, emailUpdatesAllowed: Bool) {
  
        UserRequest.register(name: name, email: email, password: password, phoneNumber: phoneNumber, emailUpdatesAllowed: emailUpdatesAllowed, cpf: cpf) { response in
            guard let safeDelegate = self.delegate else { return }
            
            if (response.response?.statusCode == 200) {
                safeDelegate.sucessRegister("Registro realizado com sucesso!")
            } else {
                safeDelegate.errorRegister("Ocorreu um erro ao efetuar o registro. Verifique sua conexão e tente novamente")
            }
            debugPrint(response)
        }
    }
}
