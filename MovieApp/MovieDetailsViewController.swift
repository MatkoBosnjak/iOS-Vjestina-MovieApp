//
//  MovieDetailsViewController.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.04.2023..
//

import Foundation
import UIKit
import MovieAppData
import PureLayout

class MovieDetailsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieData.crewMembers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellIdentifier", for: indexPath) as! MovieDetailsCell
        cell.namePlusMoviePosition(name: crew[indexPath.item].name, position: crew[indexPath.item].role)
        return cell
    }
    
    private var collectionView: UICollectionView!
    private var movieCover: MovieCover!
    private var movieDescription: MovieDescription!
    private var movieData: MovieDetailsModel!
    private var crew: [MovieCrewMemberModel]!
    private var layout: UICollectionViewFlowLayout!
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildViews()
    }
    
    private func buildViews(){

        view.backgroundColor = .white

        movieData = MovieUseCase().getDetails(id: 111161)
        crew = movieData.crewMembers

        movieCover = MovieCover()
        view.addSubview(movieCover)

        movieDescription = MovieDescription(synopsis: movieData.summary)
        view.addSubview(movieDescription)

        layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (view.bounds.width / 3) - 20, height: 50)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5

        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MovieDetailsCell.self, forCellWithReuseIdentifier: "CellIdentifier")
        view.addSubview(collectionView)

        movieCover.autoPinEdge(toSuperviewEdge: .top)
        movieCover.autoPinEdge(toSuperviewEdge: .leading)
        movieCover.autoPinEdge(toSuperviewEdge: .trailing)

        movieDescription.autoPinEdge(toSuperviewEdge: .leading)
        movieDescription.autoPinEdge(toSuperviewEdge: .top, withInset: 412)
        movieDescription.autoPinEdge(toSuperviewEdge: .trailing)

        collectionView.autoPinEdge(toSuperviewEdge: .top, withInset: 555)
        collectionView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        collectionView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        collectionView.autoPinEdge(toSuperviewEdge: .bottom)

    }
}
