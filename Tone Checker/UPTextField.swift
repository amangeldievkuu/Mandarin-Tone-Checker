//
//  UPTextField.swift
//  Tone Checker
//
//  Created by Adam Amangeldiev on 2025/1/13.
//

import UIKit

class UPTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(tContentType: UITextContentType, textPlaceholder: String) {
        super.init(frame: .zero)
        self.textContentType = tContentType
        self.placeholder = textPlaceholder
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints  = false
        
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        autocapitalizationType = .none
        
        backgroundColor = .tertiarySystemBackground
        autocorrectionType = .no
        returnKeyType = .done
        clearButtonMode = .whileEditing
    }
    
}
