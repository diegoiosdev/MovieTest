//
//  MovieTestViewModel.swift
//  MovieTest
//
//  Created by Diego Fernando on 08/01/22.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieTestViewModelProtocol {
    var movieDetails: BehaviorRelay<MovieDetailsModel?> { get set }
    var movieSimilar: BehaviorRelay<MovieSimilarModel?> { get set }
    
    func getMovie(with movieId: Int)
    func getImage(with imagePath: String?, completion: @escaping (Data?) -> Void)
}

class MovieTestViewModel: MovieTestViewModelProtocol {
   
    // MARK: - Properties
    var movieDetails = BehaviorRelay<MovieDetailsModel?>(value: nil)
    var movieSimilar = BehaviorRelay<MovieSimilarModel?>(value: nil)
    
    private var useCase: MovieTestUseCaseProtocol
    
    // MARK: - Initializer
    
    init(with useCase: MovieTestUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Functions
    
    func getMovie(with movieId: Int) {
        
        useCase.getMovieDetailsAndSimilar(movieId) { [weak self] details, similar in
            
            guard let strongSelf = self,
                  let details = details,
                  let similar = similar else {
                return
            }
            
            strongSelf.movieDetails.accept(details)
            strongSelf.movieSimilar.accept(similar)
        }
    }
    
    func getImage(with imagePath: String?, completion: @escaping (Data?) -> Void) {
        useCase.getImage(with: imagePath, completion: completion)
    }
}
