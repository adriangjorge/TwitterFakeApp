//
//  TweetTableViewCell.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 30/1/21.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: TweetTableViewCell.self)

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var idNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        avatarImageView.layer.cornerRadius = avatarImageView.bounds.height / 2.0
    }
    
    func setData(tweet: Tweet) {
        avatarImageView.image = UIImage(named: tweet.user.image)
        usernameLabel.text = tweet.user.username
        timeLabel.text = tweet.time
        messageLabel.text = tweet.message
    }
}
