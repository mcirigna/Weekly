//
//  CollectionView.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class CollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let labelView = LabelView()
    
    private let cellId = "cellId"
    let collectionView: UICollectionView
    
    override init(frame: CGRect) {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionView {
    
    func initView() {
        initHeaderView()
        initCollectionView()
        arrangeView()
    }
    
    func arrangeView() {
        addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        labelView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        labelView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16).isActive = true
        labelView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: labelView.rightAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension CollectionView {
    
    func initHeaderView() {
        labelView.upperLabel.text = "Mon"
        labelView.upperLabel.textAlignment = .center
        labelView.lowerLabel.text = "12"
        labelView.lowerLabel.textAlignment = .center
    }
}

extension CollectionView {
    
    func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let cellView = LabelView()
        cellView.color = .orange
        cellView.upperLabel.text = "Math Hw"
        cellView.lowerLabel.text = "Date"
        cell.backgroundView = cellView
        cell.selectedBackgroundView = cell.contentView
        cell.layer.borderWidth = 1
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.25
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
    
}
