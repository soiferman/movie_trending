//
//  MainViewController.swift
//  MVVM
//
//  Created by Max Soiferman on 7/2/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = MainViewModel()
    
    var cellMovies: [MoviesModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        bindViewModel()
    }
    
    func configureView() {
        self.title = "Main View"
        
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { isLoading in
            guard let isLoading else { return }
            isLoading ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
        }
        
        viewModel.cellMovies.bind { movies in
            guard let movies else { return }
            self.cellMovies = movies
            self.reloadTableView()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getMovies()
    }
    
    func openDetail(movieId: Int) {
        guard let movie = viewModel.getMovie(by: movieId) else { return }
        let detailVC = MovieDetailViewController(movie: movie)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
    
}
