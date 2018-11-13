//
//  EventCell.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    let topBarView = UIView()
    
    var title: String? {
        didSet {
            titleView.text = title
        }
    }
    let titleView = UILabel()
    
    var date: Date? {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd"
            dateView.text = formatter.string(from: date!)
        }
    }
    let dateView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EventCell {
    
    func initView() {
        initTopBarView()
        initTitleView()
        initDateView()
        arrangeView()
    }
    
    func arrangeView() {
        addSubview(topBarView)
        topBarView.translatesAutoresizingMaskIntoConstraints = false
        topBarView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topBarView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topBarView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        addSubview(titleView)
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: topBarView.bottomAnchor).isActive = true
        titleView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        titleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(dateView)
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        dateView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dateView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension EventCell {
    
    func initTopBarView() {
        topBarView.backgroundColor = .orange
        topBarView.layer.borderWidth = 0.5
    }
}

extension EventCell {
    
    func initTitleView() {
        titleView.textAlignment = .center
        titleView.text = "Math Hw"
    }
}

extension EventCell {
    
    func initDateView() {
        
    }
}
