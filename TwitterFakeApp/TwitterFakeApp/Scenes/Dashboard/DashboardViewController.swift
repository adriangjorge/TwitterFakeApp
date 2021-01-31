//
//  DashboardViewController.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 27/1/21.
//

import UIKit

protocol DashboardPresenterLogic: BasePresenterLogic {
    func totalRows() -> Int
    func getData(index: Int) -> Tweet
    func getMoreTweet()
}

class DashboardViewController: BaseViewController {
    
    var presenter: DashboardPresenterLogic?
    
    // MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = DashboardPresenter()
        presenter.view = self
        self.presenter = presenter
        
        presenter.setupView()
    }
    
    // MARK: Private methods
    
    private func dequeueTweetCell(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TweetTableViewCell.cellIdentifier, for: indexPath) as? TweetTableViewCell else {
            return UITableViewCell()
        }
        
        if let data = presenter?.getData(index: indexPath.item) {
            cell.setData(tweet: data)
        }
        return cell
    }
    
    private func dequeueLoadingCell(indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.cellIdentifier, for: indexPath) as? LoadingTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
}

// MARK: - Display logic
extension DashboardViewController: DashboardDisplayLogic {
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: TweetTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: TweetTableViewCell.cellIdentifier)
        tableView.register(UINib(nibName: LoadingTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: LoadingTableViewCell.cellIdentifier)
    }
    
    func refresh() {
        tableView.reloadData()
    }
}

// MARK: - Table view logic
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return presenter?.totalRows() ?? 0
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return dequeueTweetCell(indexPath: indexPath)
        } else {
            presenter?.getMoreTweet()
            return dequeueLoadingCell(indexPath: indexPath)
        }
    }
}
