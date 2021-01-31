//
//  LoginService.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 27/1/21.
//

protocol LoginService {
    func login(username: String, password: String, result: ServiceHandler<Bool>?)
}
