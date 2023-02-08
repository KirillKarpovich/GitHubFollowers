//
//  GHFSecondaryTitleLabel.swift
//  GitHubFollowers
//
//  Created by Kirill Karpovich on 2.02.23.
//

import UIKit

class GHFSecondaryTitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   convenience init(fontSize: CGFloat) {
        self.init(frame: .zero)
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    private func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        textAlignment = .left
        translatesAutoresizingMaskIntoConstraints = false
    }
}
