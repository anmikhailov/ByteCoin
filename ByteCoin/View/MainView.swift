//
//  MainView.swift
//  ByteCoin
//
//  Created by Andrey on 03.05.2023.
//

import UIKit

protocol MainViewDelegate: AnyObject {
//    func MainView(_ view: MainView, didTapButton button: UIButton)
}

class MainView: CustomView {
//    weak var delegate: MainViewDelegate?
    
    private lazy var background: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.backgroundColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(background)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
}

//MARK: - Actions
//private extension MainView {
//    @objc func didTapButton(_ button: UIButton) {
//        delegate?.MainView(self, didTapButton: button)
//    }
//}

