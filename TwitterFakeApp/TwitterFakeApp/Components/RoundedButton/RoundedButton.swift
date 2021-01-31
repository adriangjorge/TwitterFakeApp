//
//  RoundedButton.swift
//  TwitterFakeApp
//
//  Created by Adrián G. Jorge on 28/1/21.
//

import UIKit

class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let height = bounds.height / 2.0
        layer.cornerRadius = height
        contentEdgeInsets = UIEdgeInsets(top: contentEdgeInsets.top, left: height, bottom: contentEdgeInsets.bottom, right: height)
    }
}
