//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Max Soiferman on 8/2/24.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    public static var identifier: String {
        get { "MainMovieCell" }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }

    @IBOutlet private weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var date: UILabel!
    @IBOutlet private weak var rate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.backgroundColor = .lightGray
        backView.layer.borderColor = UIColor.label.cgColor
        backView.layer.borderWidth = 1
        backView.layer.cornerRadius = 10
        
        movieImageView.layer.cornerRadius = 5
    }

    func setupCell(viewModel: MoviesModel) {
        name.text = viewModel.title
        date.text = viewModel.releaseDate
        rate.text = "\(viewModel.voteAverage)"
        movieImageView?.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + viewModel.posterPath))
    }
    
}
