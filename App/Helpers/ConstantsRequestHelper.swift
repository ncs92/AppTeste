//
//  ConstantsRequest.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 29/10/21.
//

import Foundation
import Alamofire

class ConstantsRequestHelper {
    static let BASE_URL = "https://us-central1-rh-challenges.cloudfunctions.net/api/"
    
    static let USER_URL = BASE_URL + "users";
    
    static let LOGIN_URL = BASE_URL + "users/token";
}
