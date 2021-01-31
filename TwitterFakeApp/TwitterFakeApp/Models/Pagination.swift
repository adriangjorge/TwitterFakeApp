//
//  Pagination.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 31/1/21.
//

struct Pagination<T> {
    var collection: [T]
    var hasNextPage: Bool
}
