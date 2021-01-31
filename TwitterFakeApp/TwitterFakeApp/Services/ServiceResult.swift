//
//  ServiceResult.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 27/1/21.
//

enum ServiceResult<T> {
    case success(T)
    case error
}

typealias ServiceHandler<T> = (ServiceResult<T>) -> Void
