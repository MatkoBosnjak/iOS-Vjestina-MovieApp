//
//  MovieDetailsWithCoverView.swift
//  MovieApp
//
//  Created by endava-bootcamp on 02.04.2023..
//

import Foundation
import PureLayout
import MovieAppData

class MovieCover: UIView {
    
    private var poster: UIImageView!
    private var userRatingNumber: UILabel!
    private var userRating: UILabel!
    private var year: UILabel!
    private var date: UILabel!
    private var category: MovieCategoryModel!
    private var genre: UILabel!
    private var movieDetails: MovieDetailsModel!
    private var movieTitle: UILabel!
    private var favourite: UIButton!
    private var duration: UILabel!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: CGRect())
        movieDetails = MovieUseCase().getDetails(id: 111161)
        buildViews()
    }
    
    private func buildViews(){
        createViews()
        setViews()
        defineLayoutForViews()
    }
    
    private func createViews() {
        poster = UIImageView()
        movieTitle = UILabel()
        year = UILabel()
        favourite = UIButton()
        userRating = UILabel()
        userRatingNumber = UILabel()
        duration = UILabel()
        genre = UILabel()
        date = UILabel()
    }
    
    private func setViews() {
        
        //poster - movie cover image
        downloadImage(from: URL(string: movieDetails.imageUrl)!)
        poster.contentMode = .scaleAspectFill
        
        //movie title
        movieTitle.text = movieDetails.name
        movieTitle.textColor = .white
        movieTitle.font = UIFont.boldSystemFont(ofSize: 24)
        
        //year of production
        year.text = String("(" + String(movieDetails.year) + ")")
        year.textColor = .white
        year.font = UIFont.boldSystemFont(ofSize: 24)
        
        //favourite icon - star
        let img = UIImage(systemName: "star")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        
        favourite.setImage(img, for: .normal)
        favourite.backgroundColor = .gray
        favourite.layer.cornerRadius = 15
        
        //users ratings label
        userRating.text = "User Score"
        userRating.font = UIFont.boldSystemFont(ofSize: 14)
        userRating.textColor = .white
        
        //user ratings score
        userRatingNumber.text = String(movieDetails.rating)
        userRatingNumber.font = UIFont.boldSystemFont(ofSize: 16)
        userRatingNumber.textColor = .white
        
        //convert durations in minutes to duration in hrs and mins
        let durFormat = durationFormat(mins: movieDetails.duration)
        duration.text = String(String(durFormat.hours) + "h " + String(durFormat.minutes) + "m")
        duration.font = UIFont.boldSystemFont(ofSize: 14)
        duration.textColor = .white
        
        //movie genre
        let dirs = String(describing: movieDetails.categories[0])
        
        genre.text = dirs.capitalized
        genre.font = UIFont.systemFont(ofSize: 14)
        genre.textColor = .white
        
        //date converting
        date.textColor = .white
        
        let yearFirst = DateFormatter()
        yearFirst.dateFormat = "yyyy-mm-dd"
        guard let formatingDate = yearFirst.date(from: movieDetails.releaseDate) else {return}
        
        let dateFirst = DateFormatter()
        dateFirst.dateFormat = "dd/mm/yyyy"
        date.text = dateFirst.string(from: formatingDate)
        date.font = UIFont.systemFont(ofSize: 14)
        
      
    }
    
    private func defineLayoutForViews() {
        //adding all of the created views as subviews to the root view
        addSubview(poster)
        addSubview(movieTitle)
        addSubview(year)
        addSubview(date)
        addSubview(favourite)
        addSubview(userRating)
        addSubview(userRatingNumber)
        addSubview(duration)
        addSubview(genre)
        
        
        poster.autoPinEdge(toSuperviewEdge: .top)
        poster.autoPinEdge(toSuperviewEdge: .leading)
        poster.autoPinEdge(toSuperviewEdge: .trailing)
        poster.autoSetDimension(.height, toSize: 260)
        
        movieTitle.autoPinEdge(toSuperviewEdge: .left, withInset: 5)
        movieTitle.autoPinEdge(toSuperviewEdge: .top, withInset: 260)
        
        year.autoPinEdge(.leading, to: .trailing, of: movieTitle, withOffset: 5)
        year.autoPinEdge(toSuperviewEdge: .top, withInset: 260)
        
        date.autoPinEdge(.top, to: .bottom, of: movieTitle, withOffset: 20)
        date.autoPinEdge(toSuperviewEdge: .left, withInset: 5)
        
        favourite.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        favourite.autoPinEdge(.top, to: .bottom, of: duration, withOffset: 20)
        favourite.autoSetDimension(.width, toSize: 32)
        favourite.autoSetDimension(.height, toSize: 32)
        
        userRatingNumber.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -20)
        userRatingNumber.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        
        userRating.autoPinEdge(.leading, to: .trailing, of: userRatingNumber, withOffset: 10)
        userRating.autoPinEdge(.bottom, to: .top, of: movieTitle, withOffset: -20)
        
        genre.autoPinEdge(toSuperviewEdge: .leading, withInset: 5)
        genre.autoPinEdge(.top, to: .bottom, of: date, withOffset: 10)
        
        duration.autoPinEdge(.leading, to: .trailing, of: genre, withOffset: 15)
        duration.autoPinEdge(.top, to: .bottom, of: date, withOffset: 10)

    }
    
    
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()){
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.poster.image = UIImage(data: data)
            }
        }
    }
    
    //function for onverting into correct duration format
    func durationFormat(mins: Int) -> (hours: Int , minutes: Int){
        let hours = mins / 60
        let minutes = mins % 60
        return (hours, minutes)
    }
}
