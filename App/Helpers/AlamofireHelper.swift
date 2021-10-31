//
//  AppService.swift
//  AppTest
//
//  Created by Elaine Cecilio Sangali on 29/10/21.
//

import Foundation
import Alamofire

class AlamofireHelper {
    static let REQUEST_TIMEOUT: TimeInterval = TimeInterval(30)
    static let SERVER_TIMEOUT: TimeInterval = TimeInterval(40)
    
    private static var alamofireSession: Alamofire.Session?
    
    static func request<Parameters: Encodable>(_ convertible: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        encoder: ParameterEncoder = URLEncodedFormParameterEncoder.default,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil) -> DataRequest {
        
        initAlamofire()
        
        return AF.request(convertible, method: method, parameters: parameters, encoder: encoder, headers: headers, interceptor: interceptor)
    }
    
    private static func initAlamofire() {
        if alamofireSession == nil {
            var headers = HTTPHeaders.default.dictionary
            
            if UserService.hasToken() {
                headers["x-access-token"] = UserService.getToken()
            }
            
            let configuration = URLSessionConfiguration.default
            configuration.timeoutIntervalForResource = SERVER_TIMEOUT
            configuration.timeoutIntervalForResource = REQUEST_TIMEOUT
            configuration.httpAdditionalHeaders = headers
            
            alamofireSession = Alamofire.Session(configuration: configuration)
        }
    }
    
    public static func logout() {
        alamofireSession = nil
    }
}
