//
//  MainViewController.swift
//  ByteCoin
//
//  Created by Andrey on 03.05.2023.
//

import UIKit

class MainViewController: CustomViewController<MainView> {
    
    let coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        customView.delegate = self
        customView.currencyPicker.dataSource = self
        customView.currencyPicker.delegate = self
    }
    
    
}

//MARK: - UIPickerViewDataSource
extension MainViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

//MARK: - UIPickerViewDelegate
extension MainViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.getCoinPrice(for: coinManager.currencyArray[row])
    }
}

//extension MainViewController: MainViewDelegate {
//    func MainView(_ view: MainView, didTapButton button: UIButton) {
//    }
//}
