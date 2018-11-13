//
//  ViewController.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainView: MainView { return self.view as! MainView }

    override func viewDidLoad() {
        super.viewDidLoad()
        loadMainView()
    }

    private func loadMainView() {
        let view = MainView(frame: self.view.frame)
        self.view = view
    }


}

