//
//  ViewController.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let model = Model()
    
    let topBarView = UIView()
    
    let cellId = "tableViewCell"
    let tableView = UITableView()
    
    let bottomBarView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }
}

extension MainViewController {
    
    func initView() {
        initTopBarView()
        initTableView()
        initBottomBarView()
        arrangeView()
    }
    
    func arrangeView() {
        view.addSubview(topBarView)
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        topBarView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        topBarView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topBarView.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.86).isActive = true
        
        view.addSubview(bottomBarView)
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        bottomBarView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        bottomBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension MainViewController {
    
    func initTopBarView() {
        
        topBarView.backgroundColor = .white
    }
}

extension MainViewController {
    
    func initTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        self.tableView.tableFooterView = UIView(frame: .zero)
        let separatorInset: CGFloat = 10
        tableView.separatorInset = UIEdgeInsets(top: 0, left: separatorInset, bottom: 0, right: separatorInset)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        
        let dayView = CollectionView()
        
//        dayView.day = model.getDay(index: indexPath.item)
//        dayView.date = model.getDate(index: indexPath.item)
        cell.backgroundView = dayView
        
        cell.selectedBackgroundView = cell.contentView
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.height / 7)
    }
    
}

extension MainViewController {
    
    func initBottomBarView() {
        
        bottomBarView.backgroundColor = .white
    }
}

