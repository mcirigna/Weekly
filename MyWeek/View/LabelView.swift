//
//  EventCell.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class LabelView: UIView {
    
    let colorBar = UIView()
    var color: UIColor? {
        didSet {
            colorBar.backgroundColor = color
        }
    }
    
    let upperLabel = UILabel()
    
    let lowerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LabelView {
    
    func initView() {
        initColorBar()
        initUpperLabel()
        initLowerLabel()
        arrangeView()
    }
    
    func arrangeView() {
        addSubview(colorBar)
        colorBar.translatesAutoresizingMaskIntoConstraints = false
        colorBar.topAnchor.constraint(equalTo: topAnchor).isActive = true
        colorBar.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        colorBar.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1).isActive = true
        
        addSubview(upperLabel)
        upperLabel.translatesAutoresizingMaskIntoConstraints = false
        upperLabel.topAnchor.constraint(equalTo: colorBar.bottomAnchor).isActive = true
        upperLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        upperLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(lowerLabel)
        lowerLabel.translatesAutoresizingMaskIntoConstraints = false
        lowerLabel.topAnchor.constraint(equalTo: upperLabel.bottomAnchor).isActive = true
        lowerLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        lowerLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension LabelView {
    
    func initColorBar() {
        
    }
}

extension LabelView {
    
    func initUpperLabel() {
        upperLabel.textAlignment = .center
        upperLabel.text = "Math Hw"
    }
}

extension LabelView {
    
    func initLowerLabel() {
        
    }
}
