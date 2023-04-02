//
//  MovieDetailsCell.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.04.2023..
//

import Foundation
import UIKit

class MovieDetailsCell: UICollectionViewCell {
    
    private var nameLabel: UILabel!
    private var moviePositionLabel: UILabel!
    
    init(name: String = "", role: String = "") {
        super.init(frame: CGRect())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildViews()
    }
        
    private func buildViews() {
        createViews()
        setViews()
        defineLayoutForViews()
    }
    private func createViews() {
        nameLabel = UILabel()
        moviePositionLabel = UILabel()
    }
    
    private func setViews() {
        nameLabel.font = UIFont.boldSystemFont(ofSize: 14)

        moviePositionLabel.font = UIFont.systemFont(ofSize: 14)
    }
        
    private func defineLayoutForViews() {
        addSubview(nameLabel)
        addSubview(moviePositionLabel)
        
        nameLabel.autoPinEdge(toSuperviewEdge: .leading)
        nameLabel.autoPinEdge(toSuperviewEdge: .top)
        
        moviePositionLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 5)
        moviePositionLabel.autoPinEdge(toSuperviewEdge: .leading)
    }
    
    func namePlusMoviePosition(name: String, position: String){
        nameLabel.text = name
        moviePositionLabel.text = position
    }
    
}
