//
//  UPBodyLabel.swift
//  Tone Checker
//
//  Created by Adam Amangeldiev on 2025/1/15.
//

import UIKit

class UPBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, color: UIColor = .label) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.textColor = color
        configure()
    }
    
    
    private func configure() {
        font                              = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        adjustsFontSizeToFitWidth         = true
        minimumScaleFactor                = 0.9
        numberOfLines                     = 0
        lineBreakMode                     = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }

}

