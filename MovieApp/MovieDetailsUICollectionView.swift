//
//  MovieDetailsUICollectionView.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.04.2023..
//

import Foundation
import UIKit
import MovieAppData

class MovieDetailsUICollectionView: UICollectionView {
    
    private var data: [MovieCrewMemberModel]!
    
    init(data: [MovieCrewMemberModel]) {
        super.init(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
        self.data = data
        self.register(MovieDetailsCell.self, forCellWithReuseIdentifier: "CellIdentifier")
        self.backgroundColor = .clear
        self.isScrollEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
