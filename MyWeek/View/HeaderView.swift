//
//  HeaderCell.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    var day: String? {
        didSet {
            dayView.text = day
        }
    }
    let dayView = UILabel()
    
    var date: Date? {
        didSet {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd"
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

extension HeaderView {
    
    func initView() {
        initDayView()
        initDateView()
        arrangeView()
    }
    
    func arrangeView() {
        addSubview(dayView)
        dayView.translatesAutoresizingMaskIntoConstraints = false
        dayView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dayView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dayView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(dateView)
        dateView.translatesAutoresizingMaskIntoConstraints = false
        dateView.topAnchor.constraint(equalTo: dayView.bottomAnchor).isActive = true
        dateView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        dateView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension HeaderView {
    
    func initDayView() {
        dayView.textAlignment = .center
    }
}

extension HeaderView {
    
    func initDateView() {
        dateView.textAlignment = .center
    }
}
