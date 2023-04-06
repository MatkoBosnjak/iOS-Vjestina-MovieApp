//
//  MovieDetailsOverview.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.04.2023..
//

import Foundation
import PureLayout

class MovieDescription: UIView {
    
    private var synopsis: String!
    private var overview: UILabel!
    private var descr: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(synopsis: String = "") {
        super.init(frame: CGRect())
        self.synopsis = synopsis
        buildViews()
    }
    
    private func buildViews(){
        createViews()
        setViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        overview = UILabel()
        descr = UILabel()
    }
    
    private func setViews() {
        
        overview.text = "Overview"
        overview.font = UIFont.boldSystemFont(ofSize: 20)
        overview.textColor = .black
        
        
        descr.text = synopsis
        descr.font = UIFont.systemFont(ofSize: 14)
        descr.lineBreakMode = .byWordWrapping
        descr.numberOfLines = 0
    }
    
    private func defineLayoutForViews() {
        
        addSubview(overview)
        addSubview(descr)
        
        overview.autoPinEdge(toSuperviewEdge: .top, withInset: 22)
        overview.autoPinEdge(toSuperviewEdge: .leading, withInset: 20)
        
        descr.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        descr.autoPinEdge(.top, to: .bottom, of: overview, withOffset: 10)
        descr.autoPinEdge(toSuperviewEdge: .trailing, withInset: 26)
    }
}
