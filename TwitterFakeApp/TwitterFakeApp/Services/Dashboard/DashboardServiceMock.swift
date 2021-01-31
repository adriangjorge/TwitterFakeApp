//
//  DashboardServiceMock.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 31/1/21.
//

import UIKit

class DashboardServiceMock: DashboardService {
    
    private let tweets: [Tweet] = [
        Tweet(user: SimpleUser(username: "Adrian G. Jorge", image: "profile01"),
              message: "Si el Rubius se ha ido a Andorra para estar tranquilo y salir a la calle yo le puedo recomendar 20 pueblos de Salamanca donde no le conocería ni el panadero, que no se agobie por eso, pobrecito mío.",
              photos: ["Photo1"],
              time: "2h"),
        Tweet(user: SimpleUser(username: "Ibai Llanos", image: "profile01"),
              message: "Si el Rubius se ha ido a Andorra para estar tranquilo y salir a la calle yo le puedo recomendar 20 pueblos de Salamanca donde no le conocería ni el panadero, que no se agobie por eso, pobrecito mío.",
              photos: ["Photo1"],
              time: "2h"),
        Tweet(user: SimpleUser(username: "Adrian G. Jorge", image: "profile01"),
              message: "Si el Rubius se ha ido a Andorra para estar tranquilo y salir a la calle yo le puedo recomendar 20 pueblos de Salamanca donde no le conocería ni el panadero, que no se agobie por eso, pobrecito mío.",
              photos: ["Photo1"],
              time: "2h"),
        Tweet(user: SimpleUser(username: "Adrian G. Jorge", image: "profile01"),
              message: "Si el Rubius se ha ido a Andorra para estar tranquilo y salir a la calle yo le puedo recomendar 20 pueblos de Salamanca donde no le conocería ni el panadero, que no se agobie por eso, pobrecito mío.",
              photos: ["Photo1"],
              time: "2h"),
        Tweet(user: SimpleUser(username: "Adrian G. Jorge", image: "profile01"),
              message: "Si el Rubius se ha ido a Andorra para estar tranquilo y salir a la calle yo le puedo recomendar 20 pueblos de Salamanca donde no le conocería ni el panadero, que no se agobie por eso, pobrecito mío.",
              photos: ["Photo1"],
              time: "2h")
    ]
    
    func get(index: Int, amount: Int, result: ServiceHandler<Pagination<Tweet>>?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            
            let response = Pagination<Tweet>(collection: self.tweets, hasNextPage: true)
            result?(.success(response))
        }
    }
}
