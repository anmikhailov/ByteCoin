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
    
    var currencyPicker: UIPickerView {
        return pickerView
    }
    
    private lazy var background: UIView = {
        let element = UIView()
        element.backgroundColor = Resources.Colors.backgroundColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var mainVStack: UIStackView = {
        let element = UIStackView()
        element.axis = .vertical
        element.spacing = 25
        element.alignment = .center
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var topLabel: UILabel = {
        let element = UILabel()
        element.text = "ByteCoin"
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 50, weight: .thin)
        element.textColor = Resources.Colors.titleColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coinView: UIView = {
        let element = UIView()
        element.backgroundColor = UIColor.tertiaryLabel
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var coinViewHStack: UIStackView = {
        let element = UIStackView()
        element.axis = .horizontal
        element.spacing = 5
        element.alignment = .center
        element.distribution = .fill
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var bitcoinImage: UIImageView = {
        let element = UIImageView()
        element.image = Resources.Icons.bitcoinIcon
        element.tintColor = Resources.Colors.iconColor
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var calculatedValueLabel: UILabel = {
        let element = UILabel()
        element.text = "..."
        element.textAlignment = .center
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var currencyLabel: UILabel = {
        let element = UILabel()
        element.text = "USD"
        element.textAlignment = .right
        element.font = UIFont.systemFont(ofSize: 25)
        element.textColor = .white
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private lazy var pickerView: UIPickerView = {
        let element = UIPickerView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    override func setViews() {
        super.setViews()
        
        self.addSubview(background)
        self.addSubview(mainVStack)
        self.addSubview(pickerView)
        
        mainVStack.addArrangedSubview(topLabel)
        mainVStack.addArrangedSubview(coinView)
        
        coinView.addSubview(coinViewHStack)
        
        coinViewHStack.addArrangedSubview(bitcoinImage)
        coinViewHStack.addArrangedSubview(calculatedValueLabel)
        coinViewHStack.addArrangedSubview(currencyLabel)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            mainVStack.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            mainVStack.heightAnchor.constraint(equalToConstant: 200),
            mainVStack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            mainVStack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            
            coinView.heightAnchor.constraint(equalToConstant: 80),
            coinView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            coinView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            coinViewHStack.topAnchor.constraint(equalTo: coinView.topAnchor),
            coinViewHStack.bottomAnchor.constraint(equalTo: coinView.bottomAnchor),
            coinViewHStack.leadingAnchor.constraint(equalTo: coinView.leadingAnchor, constant: 10),
            coinViewHStack.trailingAnchor.constraint(equalTo: coinView.trailingAnchor, constant: -10),
            
            bitcoinImage.heightAnchor.constraint(equalToConstant: 70),
            bitcoinImage.widthAnchor.constraint(equalToConstant: 70),
            
            pickerView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            pickerView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            pickerView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

//MARK: - Actions
//private extension MainView {
//    @objc func didTapButton(_ button: UIButton) {
//        delegate?.MainView(self, didTapButton: button)
//    }
//}

