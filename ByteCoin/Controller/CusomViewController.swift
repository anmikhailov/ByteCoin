//
//  CusomViewController.swift
//  ByteCoin
//
//  Created by Andrey on 03.05.2023.
//

import UIKit

class CustomViewController<V: CustomView>: UIViewController {
    override func loadView() {
        view = V()
    }
    
    var customView: V {
        return view as! V
    }
}
