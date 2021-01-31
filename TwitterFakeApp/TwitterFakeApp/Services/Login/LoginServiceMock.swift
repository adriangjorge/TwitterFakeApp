//
//  LoginServiceMock.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 27/1/21.
//

import UIKit

class LoginServiceMock: LoginService {
    
    func login(username: String, password: String, result: ServiceHandler<Bool>?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            result?(.success(true))
        }
    }
    
}
