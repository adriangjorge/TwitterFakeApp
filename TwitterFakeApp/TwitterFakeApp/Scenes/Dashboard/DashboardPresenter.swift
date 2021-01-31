//
//  DashboardPresenter.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 30/1/21.
//

protocol DashboardDisplayLogic: BaseDisplayLogic {
    func refresh()
}

class DashboardPresenter: BasePresenter {
    
    var view: DashboardDisplayLogic?
    
    var service: DashboardService = DashboardServiceMock()
    
    // MARK: Variables
    private var tweets: [Tweet] = []
    
}

// MARK: - Presenter logic
extension DashboardPresenter: DashboardPresenterLogic {
    
    func setupView() {
        view?.setupView()
        getMoreTweet()
    }
    
    func totalRows() -> Int {
        return tweets.count
    }
    
    func getData(index: Int) -> Tweet {
        return tweets[index]
    }
    
    func getMoreTweet() {
        service.get(index: tweets.count, amount: 1) { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.tweets.append(contentsOf: data.collection)
                self?.view?.refresh()
            case .error:
                break
            }
        }
    }
}
