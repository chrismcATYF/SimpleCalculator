//
//  CornerRadius.swift
//  Simple Calculator
//
//  Created by Chris McDonald on 8/29/17.
//  Copyright © 2017 Chris McDonald. All rights reserved.
//

import UIKit

@IBDesignable
class CornerRadius: UIButton {
    @IBInspectable var roundedButton: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = roundedButton
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    func setupView() {
        self.layer.cornerRadius = roundedButton
    }
}
