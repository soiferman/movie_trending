//
//  MovieDetailViewController.swift
//  MovieTrending
//
//  Created by Max Soiferman on 8/2/24.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {
    
    var movie: MoviesModel
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    init(movie: MoviesModel) {
        self.movie = movie
        super.init(nibName: "MovieDetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configureCell()
    }

    private func configureCell() {
        titleLabel.text = movie.title
        descriptionLabel.text = movie.overview
        imageView.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/" + movie.posterPath))
    }
    

}
  
