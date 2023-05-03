//
//  CustomView.swift
//  ByteCoin
//
//  Created by Andrey on 03.05.2023.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        layoutViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setViews()
        layoutViews()
    }

    /// Set your view and its subviews here.
    func setViews() {
        backgroundColor = .systemBackground
    }

    /// Layout your subviews here.
    func layoutViews() {}
    
}

