//
//  EventCell.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
    
    private let colorBar = UIView()
    var color: UIColor = .orange {
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

extension EventCell {
    
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

extension EventCell {
    
    func initColorBar() {
        colorBar.backgroundColor = .orange
        colorBar.layer.borderWidth = 0.5
    }
}

extension EventCell {
    
    func initUpperLabel() {
        upperLabel.textAlignment = .center
        upperLabel.text = "Math Hw"
    }
}

extension EventCell {
    
    func initLowerLabel() {
        
    }
}
