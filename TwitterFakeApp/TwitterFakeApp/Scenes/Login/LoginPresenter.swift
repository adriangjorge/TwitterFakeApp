//
//  LoginPresenter.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 26/1/21.
//

protocol LoginDisplayLogic: BaseDisplayLogic {
    func showLoading()
    func dismissLoading()
    func showLoginIncorrect()
    func navigateToHome()
}

class LoginPresenter: BasePresenter {
    
    var view: LoginDisplayLogic?
    
    var loginService: LoginService = LoginServiceMock()
    
}

// MARK: - Presenter logic
extension LoginPresenter: LoginPresenterLogic {
    
    func setupView() {
        view?.setupView()
        load()
    }
    
    func login(usename: String, password: String) {
        view?.showLoading()
        loginService.login(username: usename, password: password) { [weak self] (result) in
            self?.view?.dismissLoading()
            switch result {
            case .success(let isCorrect):
                if isCorrect {
                    self?.view?.navigateToHome()
                } else {
                    self?.view?.showLoginIncorrect()
                }
            case .error:
                break
            }
        }
    }
    
    private func load() {
        login(usename: "", password: "")
    }
}
