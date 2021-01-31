//
//  DashboardService.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 31/1/21.
//

protocol DashboardService {
    func get(index: Int, amount: Int, result: ServiceHandler<Pagination<Tweet>>?)
}
