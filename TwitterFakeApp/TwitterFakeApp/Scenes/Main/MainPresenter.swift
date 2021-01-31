//
//  MainPresenter.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 30/1/21.
//

protocol MainDisplayLogic: BaseDisplayLogic {

}

class MainPresenter: BasePresenter {
    
    var view: MainDisplayLogic?
    
}

// MARK: - Presenter logic
extension MainPresenter: MainPresenterLogic {
    
    func setupView() {
        view?.setupView()
    }
}
