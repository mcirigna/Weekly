//
//  MainView.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class MainView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let topBarView: UIView
    
    let cellId = "tableViewCell"
    let tableView: UITableView
    
    let bottomBarView: UIView
    
    override init(frame: CGRect) {
        
        func getFrame(from: CGRect, percentage val: CGFloat) -> CGRect {
            let height = from.height / val
            let width = from.width / val
            let frame = CGRect(x: 0, y: 0, width: width, height: height)
            return frame
        }
        
        topBarView = UIView(frame: getFrame(from: frame, percentage: 7))
        tableView = UITableView(frame: getFrame(from: frame, percentage: 86))
        bottomBarView = UIView(frame: getFrame(from: frame, percentage: 7))
        
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MainView {
    
    func initView() {
        initTopBarView()
        initTableView()
        initBottomBarView()
        arrangeView()
    }
    
    func arrangeView() {
        addSubview(topBarView)
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        topBarView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        topBarView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        topBarView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.07).isActive = true
        
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topBarView.bottomAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.86).isActive = true

        addSubview(bottomBarView)
        bottomBarView.translatesAutoresizingMaskIntoConstraints = false
        bottomBarView.topAnchor.constraint(equalTo: tableView.bottomAnchor).isActive = true
        bottomBarView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor).isActive = true
        bottomBarView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

extension MainView {
    
    func initTopBarView() {
        
        topBarView.backgroundColor = .white
    }
}

extension MainView {
    
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
        let backgroundView = CollectionView(frame: tableView.frame)
        cell.backgroundView = backgroundView
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

extension MainView {
    
    func initBottomBarView() {
        
        bottomBarView.backgroundColor = .white
    }
}
