//
//  LoginService.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 30/10/21.
//

import Foundation

class UserService {
    private static let TOKEN = "TOKEN"
    private static let USER = "USER"
    
    static func setToken(_ token: String) {
        UserDefaults.standard.setValue(token, forKey: TOKEN)
    }
    
    static func getToken() -> String? {
        return UserDefaults.standard.string(forKey: TOKEN)
    }
    
    static func hasToken() -> Bool {
        return getToken() != nil
    }
    
    static func saveUser(id: String, name: String, cpf: String, email: String) {
        let user: [String : String] = [
            "id": id,
            "name": name,
            "cpf": cpf,
            "email": email
        ]
        UserDefaults.standard.setValue(user, forKey: USER)
    }
    
    static func logout() {
        UserDefaults.standard.removeObject(forKey: USER)
        UserDefaults.standard.removeObject(forKey: TOKEN)
    }
    
    static func getUser() -> [String: Any]? {
        return UserDefaults.standard.dictionary(forKey: USER)
    }
    
    static func hasUser() -> Bool {
        return getUser() != nil
    }
}
