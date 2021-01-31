//
//  MainViewController.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 30/1/21.
//

import UIKit

protocol MainPresenterLogic: BasePresenterLogic {
    
}

class MainViewController: BaseViewController {
    
    var presenter: MainPresenterLogic?
    
    // MARK: Outlets
    
    @IBOutlet weak var menuImageView: UIImageView!
    
    @IBOutlet weak var notifView: UIView!
    @IBOutlet weak var notifImageView: UIImageView!
    @IBOutlet weak var notifLabel: PaddingLabel!
    
    @IBOutlet weak var bodyContainerView: UIView!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = MainPresenter()
        presenter.view = self
        self.presenter = presenter
        
        presenter.setupView()
    }
    
    @objc func notifTapped() {
        
    }
    
    // MARK: Private methods
    
    private func setBodyView(vc: UIViewController) {
        addChild(vc)
        vc.view.frame = bodyContainerView.bounds
        bodyContainerView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    private func setNotif(num: Int) {
        if num < 1 {
            notifLabel.isHidden = true
            return
        }
        
        notifLabel.isHidden = false
        notifLabel.text = "\(num)"
    }
}

// MARK: - Display logic
extension MainViewController: MainDisplayLogic {
    
    func setupView() {
        
        menuImageView.image = menuImageView.image?.withRenderingMode(.alwaysTemplate)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.notifTapped))
        notifView.addGestureRecognizer(tap)
        
        notifImageView.image = notifImageView.image?.withRenderingMode(.alwaysTemplate)
        
        notifLabel.layer.cornerRadius = notifLabel.bounds.height / 2.0
        
        setNotif(num: 9)
        
        guard let viewController = UIStoryboard(name: "Dashboard", bundle:nil).instantiateInitialViewController() else { return }
        setBodyView(vc: viewController)
    }
}
