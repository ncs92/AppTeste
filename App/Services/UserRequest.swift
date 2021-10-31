//
//  UserRequest.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 30/10/21.
//

import Foundation
import Alamofire

struct RegisterRequestParameters: Codable {
    let name: String
    let email: String
    let phoneNumber: String
    let password: String
    let emailUpdatesAllowed: Bool
    let cpf: String
}

class UserRequest {
    
    static func login(email: String, password: String, callback: @escaping (AFDataResponse<Any>) -> Void) {
        let parameters: [String: String] = [
            "email": email,
            "password": password,
        ]

        AlamofireHelper.request(ConstantsRequestHelper.LOGIN_URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseJSON(completionHandler: callback)
    }
    
    static func register(name: String, email: String, password: String, phoneNumber: String, emailUpdatesAllowed: Bool, cpf: String, callback: @escaping (AFDataResponse<Any>) -> Void) {
        
        let parameters = RegisterRequestParameters(name: name, email: email, phoneNumber: phoneNumber, password: password, emailUpdatesAllowed: emailUpdatesAllowed, cpf: cpf)

        print(ConstantsRequestHelper.USER_URL)
        print(parameters)
        
        AlamofireHelper.request(ConstantsRequestHelper.USER_URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseJSON(completionHandler: callback)
    }
}


