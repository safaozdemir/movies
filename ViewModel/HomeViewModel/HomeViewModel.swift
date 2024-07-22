//
//  HomeViewModel.swift
//  movies
//
//  Created by Muhammed Safa Ozdemir on 21.07.2024.
//

import Foundation

final class HomeViewModel: HomeViewModelProtocol{

    var delegate: HomeViewModelDelegate
    var service: NetworkServiceProtokol
    
    init(service: NetworkServiceProtokol, delegate: HomeViewModelDelegate) {
            self.service = service
            self.delegate = delegate
        }
    
    func load() {
        service.fetchData(.popular) { (result: Result<Movies, Error>) in
            switch result {
            case .success(let movies):
                let results = movies.results ?? []
                self.delegate.handleOutput(.popular(results))
            case .failure(let error):
                self.delegate.handleOutput(.error(error))
            }
        }
    }
    
    
}
