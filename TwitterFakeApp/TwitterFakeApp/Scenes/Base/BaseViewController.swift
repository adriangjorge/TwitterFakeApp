//
//  BaseViewController.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 26/1/21.
//

import UIKit

protocol BasePresenterLogic: class {
    func setupView()
}

class BaseViewController: UIViewController {
    
    // MARK: Loading screen
    
    private var loadingVC: UIViewController?
    
    func showLoading() {
        guard let viewController = UIStoryboard(name: SceneName.loading, bundle: nil).instantiateInitialViewController()  else { return }
        loadingVC = viewController
        view.addSubview(viewController.view)
    }
    
    func dismissLoading() {
        loadingVC?.view.removeFromSuperview()
    }
}
