//
//  SocialBarView.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 30/1/21.
//

import UIKit

class SocialBarView: UIView {
    
    @IBOutlet weak var commentImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var retweetImageView: UIImageView!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var likeImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var shareImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        
        if let color = UIColor(named: "TextColor") {
            setBaseColor(color)
        }
        
        commentImageView.image = commentImageView.image?.withRenderingMode(.alwaysTemplate)
        retweetImageView.image = retweetImageView.image?.withRenderingMode(.alwaysTemplate)
        likeImageView.image = likeImageView.image?.withRenderingMode(.alwaysTemplate)
        shareImageView.image = shareImageView.image?.withRenderingMode(.alwaysTemplate)
    }
    
    private func setBaseColor(_ color: UIColor) {
        commentImageView.tintColor = color
        commentLabel.textColor = color
        retweetImageView.tintColor = color
        retweetLabel.textColor = color
        likeImageView.tintColor = color
        likeLabel.textColor = color
        shareImageView.tintColor = color
    }
    
    // ------------------------

    var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    func xibSetup() {
        backgroundColor = UIColor.clear
        view = loadNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view]))
    }
    
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
