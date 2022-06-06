//
//  NetWorkingProvider.swift
//  Networking
//
//  Created by ISAAC DAVID SANTIAGO on 03/06/22.
//

import Foundation
import Alamofire

final class NetWorkingProvider{
    static let shared = NetWorkingProvider()
    
    private let kBaseUrl = "https://gorest.co.in/public-api/"
    private let kStatusOk = 200...299
    private let kToken = "487c5e6e1e7ec27d888517096eeccc2c7f17f24ef0b2d9028f22ad17a8826d06"
    
    //metodo que regresa un usuario por metodo de una requesta a un webservice asincrono
    func getUser (id: Int,
                  success: @escaping (_ user: User) -> (),
                  failure: @escaping (_ error: Error?) -> ()){
        
        let url = "\(kBaseUrl)users/\(id)"
        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: UserResponse.self, decoder: DateDecoder()) {
                response in
                if let user = response.value?.data {
                    success(user)
                }else{
                    failure(response.error)
                }
                    
            }
    }
    
    func addUser(user: NewUser,
                 success: @escaping (_ user: User) -> (),
                 failure: @escaping (_ error: Error?) -> ()){
        let url = "\(kBaseUrl)users"
        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]
        
        AF.request(url, method: .post, parameters: user,encoder: JSONParameterEncoder.default, headers: headers )
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: UserResponse.self, decoder: DateDecoder()) {
                response in
                if let user = response.value?.data, user.id != nil {
                    success(user)
                }else{
                    failure(response.error)
                }
                    
            }
    }
}
