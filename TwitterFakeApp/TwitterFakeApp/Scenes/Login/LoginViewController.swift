//
//  LoginViewController.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 26/1/21.
//

import UIKit

protocol LoginPresenterLogic: BasePresenterLogic {
    func login(usename: String, password: String)
}

class LoginViewController: BaseViewController {
    
    var presenter: LoginPresenterLogic?
    
    // MARK: Outlets
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = LoginPresenter()
        presenter.view = self
        self.presenter = presenter
        
        presenter.setupView()
    }
    
    // MARK: Actions
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        presenter?.login(usename: username, password: password)
    }
}

// MARK: - Display logic
extension LoginViewController: LoginDisplayLogic {
    
    func setupView() {
        
    }
    
    func showLoginIncorrect() {
        
    }
    
    func navigateToHome() {
        guard let viewController = UIStoryboard(name: "Main", bundle:nil).instantiateInitialViewController() else { return }
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
