//
//  MainViewModel.swift
//  MVVM
//
//  Created by Max Soiferman on 7/2/24.
//

import UIKit

class MainViewModel: UIViewController {
    
    var isLoading: Observable<Bool> = Observable(false)
    var movies: [MoviesModel] = []
    var cellMovies: Observable<[MoviesModel]> = Observable([])
    
    func numberOfRows() -> Int {
        return movies.count
    }
    
    func getMovies() {
        
        if isLoading.value ?? true { return }
        isLoading.value = true
        
        Task {
            do {
                self.movies = try await NetworkManager.shared.getPopularMovies()
                self.isLoading.value = false
                mapCellData()
            } catch {
                print("An error occurred while downloading movies:", error.localizedDescription)
            }
        }
    }
    
    func mapCellData() {
        self.cellMovies.value = self.movies
    }
    
    func getMovie(by id: Int) -> MoviesModel? {
        guard let movie = cellMovies.value?.first(where: {$0.id == id}) else { return nil }
        return movie
    }

}

