//
//  CollectionView.swift
//  MyWeek
//
//  Created by Marvin Cirignano on 11/9/18.
//  Copyright © 2018 Marvin Cirignano. All rights reserved.
//

import UIKit

class CollectionView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var day: String? {
        didSet {
            headerView.day = day
        }
    }
    var date: Date? {
        didSet {
            headerView.date = date
        }
    }
    let headerView = HeaderView()
    
    private let eventCellId = "eventCell"
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
        addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        headerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.16).isActive = true
        headerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: headerView.rightAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

extension CollectionView {
    
    func initHeaderView() {
        day = "Mon"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        date = formatter.date(from: "24")
    }
}

extension CollectionView {
    
    func initCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(EventCell.self, forCellWithReuseIdentifier: eventCellId)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventCellId, for: indexPath)
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
