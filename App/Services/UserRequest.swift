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

struct Person: Decodable {
    let id: String
    let name: String
    let email: String
    let cpf: String
}

struct Login: Decodable {
    let token: String
    let user: Person
}

class UserRequest {
    
    static func login(email: String, password: String, callback: @escaping (Error?, Login?) -> Void) {
        let parameters: [String: String] = [
            "email": email,
            "password": password,
        ]
        
        let request = AlamofireHelper.request(ConstantsRequestHelper.LOGIN_URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
        
        request
            .validate()
            .responseDecodable(of: Login.self) { (response) in
                switch response.result {
                    case .success:
                        guard let data = response.value else { return }
                        callback(nil, data)
                    case let .failure(error):
                        print(error)
                        callback(error, nil)
                    }
            }
    }
    
    static func register(name: String, email: String, password: String, phoneNumber: String, emailUpdatesAllowed: Bool, cpf: String, callback: @escaping (AFDataResponse<Any>) -> Void) {
        
        let parameters = RegisterRequestParameters(name: name, email: email, phoneNumber: phoneNumber, password: password, emailUpdatesAllowed: emailUpdatesAllowed, cpf: cpf)
        
        AlamofireHelper.request(ConstantsRequestHelper.USER_URL, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).responseJSON(completionHandler: callback)
    }
}


