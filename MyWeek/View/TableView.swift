//
//  TableView.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class TableView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableView {
    
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
        return (tableView.frame.height / 7) - 1
    }
    
}
