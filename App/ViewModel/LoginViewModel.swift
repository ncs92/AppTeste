//
//  LoginViewModel.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 29/10/21.
//

import Foundation
import UIKit

protocol LoginProtocol {
    func sucessLogin()
    func errorLogin(_ message: String)
}

class LoginViewModel {
    var delegate: LoginProtocol?
    
    func validateForm(validateFields: Array<Bool>) -> Bool {
        if validateFields.contains(true) {
            return false
        }
        
        return true
    }
    
    func requestLogin(email: String, password: String) {
        UserRequest.login(email: email, password: password) { (error, data) in
            guard let safeDelegate = self.delegate else { return }
            guard let loginData = data else {
                safeDelegate.errorLogin("Ocorreu um erro ao efetuar o login. Verifique sua conexão e tente novamente")
                return
            }
            let user = loginData.user
            let token = loginData.token
            
            UserService.saveUser(id: user.id, name: user.name, cpf: user.cpf, email: user.email)
            UserService.setToken(token)
 
            safeDelegate.sucessLogin()
        }
    }
    
}
