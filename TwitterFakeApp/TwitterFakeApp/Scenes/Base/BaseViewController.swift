//
//  BaseViewController.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 26/1/21.
//

import UIKit

protocol BasePresenterLogic {
    
}

class BaseViewController: UIViewController, BaseDisplayLogic {

    func setupView() {
        view.backgroundColor = .red
    }
    
}
