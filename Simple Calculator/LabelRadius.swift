//
//  LabelRadius.swift
//  Simple Calculator
//
//  Created by Chris McDonald on 8/29/17.
//  Copyright © 2017 Chris McDonald. All rights reserved.
//

import UIKit

@IBDesignable
class LabelRadius: UILabel {
    @IBInspectable var cornerRadius: CGFloat = 3.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
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
        self.layer.cornerRadius = cornerRadius
    }
}
